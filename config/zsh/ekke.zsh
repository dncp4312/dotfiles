export DJANGO_SECRET_KEY=''
export DATABASE_HOST=''
export DATABASE_PORT=''
export DATABASE_NAME=''
export DATABASE_USER=''
export DATABASE_PASSWORD=''

alias bs='cd ~/Guardian/myzen/opt/MyZen'
alias fo='cd ~/Projects/hta_bundle/frontend_v2'
alias hb='cd ~/Projects/hta_bundle'
alias fe='cd ~/Projects/hta_bundle/frontend'
alias be='cd ~/Projects/hta_bundle/backend'
alias pe='cd ~/Projects/hta_bundle/production_essentials'
alias ph='cd ~/.local/share/pry'
alias hl='cd ~/Projects/hta_bundle/shared/development/logs'
alias hs='cd ~/Projects/hta_bundle/shared/'

alias punchin='docker exec zen xdotool mousemove 450 120 click 1'
alias routes='dce backend rails routes'

alias dcab='docker attach $(docker compose ps -q backend)'
alias dcaf='docker attach $(docker compose ps -q frontend)'
alias dcas='docker attach $(docker compose ps -q sidekiq)'
alias rails='docker compose exec backend bundle exec rails'
alias rake='docker compose exec backend bundle exec rake'

alias dc='clear ; docker compose exec backend bundle exec rails console'
alias dt='clear ; docker compose exec backend bundle exec rails console -e test'
alias ds='clear ; docker compose exec -e RAILS_ENV=test backend bundle exec rspec'

alias hps='clear ; ssh -t hta docker exec -it hta_be_production bash'
alias hpc='clear ; ssh -t hta docker exec -it hta_be_production bundle exec rails console -e production'
alias hpl='clear ; ssh -t hta docker exec -itw /home/app/shared/production/logs hta_be_production bash'
alias hplf="clear ; ssh -t hta tail -fn0 production_essentials/backend/shared/production/logs/$(date +'%Y_%m'-production.log)"

alias hss='clear ; ssh -t hta docker exec -it hta_backend_staging bash'
alias hsc='clear ; ssh -t hta docker exec -it hta_backend_staging bundle exec rails console'
alias hsl='clear ; ssh -t hta docker exec -itw /home/app/shared/staging/logs hta_backend_staging bash'
alias hslf="clear ; ssh -t hta tail -fn0 production_essentials/backend/shared/staging/logs/$(date +'%Y_%m'-staging.log)"
alias hpsq='firefox hta_developer:ifyoureadthisyouowemecoffee@crm.pflegehilfe-senioren.de/sidekiq'

# alias hfdb='clear ; cd ~/Projects/hta_bundle/ci/scripts ; ./fetch_production_db.sh'
alias hfdb='clear ; ~/Projects/hta_bundle/ci/scripts/fetch_production_db.sh'
#alias hrdb='dump=$(ls ~/Projects/hta_bundle/ci/dumps | grep prod | tail -n1) ; cat ~/Projects/hta_bundle/ci/dumps/$dump | restore_hta_db'
alias hrdbn='restore_hta_db "$(ls -t=created ~/Projects/hta_bundle/ci/dumps/*prod* | tail -n1)"'
alias hrdbnd='"$(ls -t=created ~/Projects/hta_bundle/ci/dumps/*prod* | tail -n1)"'
# alias restore_hta_db="mongorestore --gzip --archive --port 28028 --nsFrom 'hta_be_production.*' --nsTo 'hta_be_dev.*' --drop"
alias restore_hta_dbs="mongorestore --gzip --archive --port 28028 --nsFrom 'hta_be_staging.*' --nsTo 'hta_be_dev.*' --drop"
# alias restore_hta_db="mongorestore --gzip --archive --port 28028 --nsFrom 'hta_be_production.*' --nsTo 'hta_be_dev.*' --drop"

alias cg='dce backend rails generate conductor'

#restore_hta_db() { mongorestore --gzip --archive --port 28028 --nsInclude "hta_be_production.$1" --nsFrom 'hta_be_production.*' --nsTo 'hta_be_dev.*' --drop }
restore_hta_db () {  
    if [ -z "$1" ]; then
        mongorestore --gzip --archive --port 28028 --nsFrom 'hta_be_production.*' --nsTo 'hta_be_dev.*' --drop
    else
        mongorestore --gzip --archive --port 28028 --nsInclude "hta_be_production.$1" --nsFrom 'hta_be_production.*' --nsTo 'hta_be_dev.*' --drop
    fi
}
hrdb() { dump=$(ls ~/Projects/hta_bundle/ci/dumps | grep prod | tail -n1) ; cat ~/Projects/hta_bundle/ci/dumps/$dump | restore_hta_db $1 }

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

# release_task () {
#     echo -n "PR Title : "
#     read -n pr_title
#     echo -n "Issue Link : "
#     read -n issue_link
#     echo
#
#     curl https://api.bitbucket.org/2.0/repositories/Ekk5tein/hta_be/pullrequests    \
# 	-u dncp4312:$BITBUCKET_APP_TOKEN                                            \
# 	--header 'Content-Type: application/json'                                   \
# 	--data '{
# 	    "title": "['$(echo $issue_link | cut -d/ -f6)']('$issue_link') '$pr_title'",
# 	    "source": { "branch": { "name": "'$(git branch --show-current)'" } },
# 	    "destination": { "branch": { "name": "release" } },
# 	    "close_source_branch": "true"
# 	}' \
#     | jq '.links.merge.href' | tr -d '"' | perl -pe 's/api.|2.0\/repositories|\/merge//g;s/llreq/ll-req/'
# }

submit_task () {
    # echo -n "PR Title : "
    # read -n pr_title
    git push
    pr_title=$*
    issue_link=$(gbc | sed -E 's|^[^/]+|https://linear.app/vanagsit/issue|; s|/pfs-([0-9]+)-|/PFS-\1/|')

    curl https://api.bitbucket.org/2.0/repositories/Ekk5tein/hta_be/pullrequests    \
	-u dncp4312:$BITBUCKET_APP_TOKEN                                            \
	--header 'Content-Type: application/json'                                   \
	--data '{
	    "title": "['$(echo $issue_link | cut -d/ -f6)']('$issue_link') '$pr_title'",
	    "source": { "branch": { "name": "'$(git branch --show-current)'" } },
	    "destination": { "branch": { "name": "development" } },
	    "close_source_branch": "true"
	}' \
    | jq '.links.merge.href' | tr -d '"' | perl -pe 's/api.|2.0\/repositories\/|\/merge//g;s/llreq/ll-req/' | xsel --clipboard --input

    firefox $issue_link
}

create_hotfix_prs () {
    create_pr master $*
    create_pr development $*
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
    | jq '.links.merge.href' | tr -d '"' | perl -pe 's/api.|2.0\/repositories\/|\/merge//g;s/llreq/ll-req/'
}

initialize_backend_deployment() {
    curl https://api.bitbucket.org/2.0/repositories/Ekk5tein/hta_be/pullrequests    \
	-u dncp4312:$BITBUCKET_APP_TOKEN                                            \
	--header 'Content-Type: application/json'                                   \
	--data '{
		    "title": "Deployment: '$2'.",
		    "source": { "branch": { "name": "'$1'" } },
		    "destination": { "branch": { "name": "'$2'" } }
		}'                                                                  \
    | jq '.links.merge.href' | tr -d '"' | read merge_link

    curl $merge_link \
	-u dncp4312:$BITBUCKET_APP_TOKEN                                            \
	--header 'Content-Type: application/json'                                   \
	--data '{ "message": "Raj deployed '$2' from '$1'." }'                           \
    | jq '.state'
}

deploy() { staging_deploy_init ; production_deploy_init }
# deploy() { initialize_backend_deployment development master }
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
    # echo -n "Username: "
    # read username
    # echo -n "Password: "
    # read -s password
    local username=$1
    local password='dev'
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
    local endpoint="$*"
    local url="http://hta.localhost/api/v2/$endpoint"
    if [[ -z "$AT" ]]; then
	echo "Access token not found. Please run 'hta_login' first."
	return 1
    fi
    response=$(curl -s -H "Authorization: Bearer $AT" "$url")
    echo "$response"
}

hta_post() {
    local url="http://hta.test/api/v2/webhooks/pandadocs"
    # if [[ -z "$AT" ]]; then
	# echo "Access token not found. Please run 'hta_login' first."
	# return 1
    # fi
    response=$(curl -s -X POST "$url")
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
    res=$(create_pr release "Fix for Sentry Issue $1" | sed 's/\//\\\//g')
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

rhdb() {
    # Define the base mongorestore command
    local cmd="mongorestore --gzip --archive --port 28028 --nsFrom 'hta_be_production.*' --nsTo 'hta_be_dev.*' --drop"

    # Loop through all arguments passed to the function (the collections)
    for collection in "$@"; do
        # Append --collection option with the collection name to the command
        cmd+=" --collection $collection"
    done

    # Execute the constructed command
    eval $cmd
}
