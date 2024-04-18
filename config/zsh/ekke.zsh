export DJANGO_SECRET_KEY=''
export DATABASE_HOST=''
export DATABASE_PORT=''
export DATABASE_NAME=''
export DATABASE_USER=''
export DATABASE_PASSWORD=''

syncup () { rsync -av ~/Projects/hta_be home:Projects/ --delete }
syncdn () { rsync -av home:Projects/hta_be ~/Projects/ --delete }

update_ekke () {
    rm ~/Documents/Ekke -r
    mv ~/Documents/Vimwiki_html ~/Documents/Ekke
    mv ~/Documents/Ekke/Watchers.html ~/Documents/Ekke/index.html
    rsync -av -e "ssh --port 2882"~/Documents/Ekke xevil@192.168.177.139:Documents
}

update_master () {
	current=$(git branch --show-current)
	bliss='\e[0;35m'
	blissbold='\033[0;32m'
	nc='\033[0m'
	printf "\n${bliss}Checking out master...${nc}\n"      ; git checkout master
	printf "\n${bliss}Fetching upstream master...${nc}\n" ; git fetch upstream master
	printf "\n${bliss}Merging upstream master...${nc}\n"  ; git merge upstream/master --ff-only
	printf "\n${bliss}Updating origin...${nc}\n"          ; git push origin master
	printf "\n${bliss}Checking out $current...${nc}\n"    ; git checkout $current
}

ppr () {
	bliss='\033[0;35m'
	nc='\033[0m'

	update_master
	printf "\n${bliss}Rebasing...${nc}\n"         ; git rebase master
	printf "\n${bliss}Updating remote...${nc}\n"  ; git push -u origin $(git branch --show-current)

	printf "\n${bliss}Pull-request prepared.\nOpening bitbucket...${nc}"
	firefox "https://bitbucket.org/dncp4312/hta_be/branches/?status=all"	
}

create_pr () {
    curl https://api.bitbucket.org/2.0/repositories/Ekk5tein/hta_be/pullrequests    \
	-u dncp4312:$BITBUCKET_APP_TOKEN                                            \
	--header 'Content-Type: application/json'                                   \
	--data '{
	    "title": "'$2'",
	    "source": { "branch": { "name": "'$(git branch --show-current)'" } },
	    "destination": { "branch": { "name": "'$1'" } },
	    "close_source_branch": "true"
	}' \
    | jq '.links.merge.href' | tr -d '"' | perl -pe 's/api.|2.0\/repositories|\/merge//g;s/llreq/ll-req/'
}

initialize_backend_deployment() {
    curl https://api.bitbucket.org/2.0/repositories/Ekk5tein/hta_be/pullrequests    \
	-u dncp4312:$BITBUCKET_APP_TOKEN                                            \
	--header 'Content-Type: application/json'                                   \
	--data '{
		    "title": "Deployment to '$2'.",
		    "source": { "branch": { "name": "'$1'" } },
		    "destination": { "branch": { "name": "'$2'" } }
		}'                                                                  \
    | jq '.links.merge.href' | tr -d '"' | read merge_link

    curl $merge_link \
	-u dncp4312:$BITBUCKET_APP_TOKEN                                            \
	--header 'Content-Type: application/json'                                   \
	--data '{ "message": "Raj merged '$1' in '$2'" }'                           \
    | jq '.state'
}

staging_deploy_init()    { initialize_backend_deployment development staging }
production_deploy_init() { initialize_backend_deployment staging master      }

admin_access_token () {
    curl -s -k -H "Content-Type: application/x-www-form-urlencoded" -d "client_id=admin-cli" -d "username=hta" -d "password=dev" -d "grant_type=password" -X POST http://hta.localhost:8083/realms/master/protocol/openid-connect/token | jq -r .access_token
    # curl https://hta.localhost:8083/realms/master/protocol/openid-connect/token -d "client_id=admin-cli" -d "username=hta" -d "password=dev" -d "grant_type=password" -H "Content-Type: application/x-www-form-urlencoded"
}

hta_keycloak_users () {
    curl -s -k -H "Content-Type: application/json" -H "Authorization: Bearer $(admin_access_token)" http://hta.localhost:8083/admin/realms/hta/users
}

hta_keycloak_roles () {
    curl -s -k -H "Content-Type: application/json" -H "Authorization: Bearer $(admin_access_token)" http://hta.localhost:8083/admin/realms/hta/roles
}

phil_at () {
    curl -s -k -H "Content-Type: application/x-www-form-urlencoded" -d "client_id=pflegehilfe-senioren-platform" -d "username=phil" -d "password=pp" -d "grant_type=password" -X POST http://hta.localhost:8083/realms/hta/protocol/openid-connect/token | jq -r .access_token
}

phil_rt () {
    curl -s -k -H "Content-Type: application/x-www-form-urlencoded" -d "client_id=pflegehilfe-senioren-platform" -d "username=phil" -d "password=pp" -d "grant_type=password" -X POST http://hta.localhost:8083/realms/hta/protocol/openid-connect/token | jq -r .refresh_token
}


hta_login() {
    echo -n "Username: "
    read username
    echo -n "Password: "
    read -s password
    echo
    response=$(curl -s -k -H "Content-Type: application/x-www-form-urlencoded" -d "client_id=pflegehilfe-senioren-platform" -d "username=$username" -d "password=$password" -d "grant_type=password" -X POST http://kc.hta.localhost/realms/hta/protocol/openid-connect/token)
    access_token=$(echo "$response" | jq -r '.access_token')

    if [[ "$access_token" != "null" ]]; then
	export AT="$access_token"
	echo 'Login Successful.'
    else
	echo 'Login unsuccessful !'
	unset AT
    fi
}

hta_get() {
    local endpoint=$1
    local url="http://hta.localhost/api/v2/$endpoint"
    if [[ -z "$AT" ]]; then
	echo "Access token not found. Please run 'hta_login' first."
	return 1
    fi
    response=$(curl -s -H "Authorization: Bearer $AT" "$url")
    echo "$response"
}

hta_patch() {
    local endpoint=$1
    local resource=$2
    local data=$3
    local url="http://hta.localhost:8081/api/v2/$endpoint/$resource"

    if [[ -z "$AT" ]]; then
	echo "Access token not found. Please run 'hta_login' first."
	return 1
    fi
    response=$(curl -X PATCH -H "Authorization: Bearer $AT" -H 'Content-Type: application/json' --data "$data" "$url")
    echo "$response" | perl -pe's/[\x00-\x1F]/ sprintf "\\u%04X", ord $& /eg' | jq
}

update_staging_db() {
    docker exec hta_db mongodump --archive=dump --db=hta_be_dev
    docker cp hta_db:dump dump
    docker cp dump hta_db_staging:dump
    docker exec hta_db_staging mongorestore --archive=dump --nsFrom 'hta_be_dev.*' --nsTo 'hta_be_test.*'
    docker exec hta_db rm dump
    docker exec hta_db_staging rm dump
    rm dump
}

sentry_fix() {
    local id=$(echo $1 | cut -d\[ -f2 | cut -d] -f1)
    git checkout development
    git checkout -b "sentry_$id"
    git commit -am "fixes sentry issue $id"
    git push
    res=$(create_pr development "Fix for Sentry Issue $1" | sed 's/\//\\\//g')
    echo $1 | sed "s/\[\([^]]*\)\](\([^)]*\))/[[$res|Resolved]] Sentry Issue \[\[\2|\1.\]\]/" | xsel
}

# sentry_fix() {
    # git checkout development
    # git checkout -b "sentry_$1"
    # git commit -am "fixes sentry issue $1"
    # git push
    # create_pr development "Fix for Sentry Issue [$1]($2)"
# }

sr() { echo $1 | sed 's/\[\([^]]*\)\](\([^)]*\))/Reviewed Sentry Issue \[\[\2|\1.\]\]/' | xclip }

server() {
    echo "89.eKKe_HTA_Ubuntu_Sudo" | sudo -S sleep 1 && sudo su -
}
