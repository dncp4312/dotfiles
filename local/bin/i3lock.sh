#!/bin/sh

BLANK='#00000000'
CLEAR='#ffffff22'
WRONG='#ffffffff'
BLISS='#8a2be2ff'
BLLSS='#8a2be235'

i3lock \
--ignore-empty-password      \
--insidever-color=$CLEAR     \
--ringver-color=$BLISS       \
\
--insidewrong-color=$CLEAR   \
--ringwrong-color=$WRONG     \
--inside-color=$BLLSS        \
--ring-color=$BLISS          \
--line-color=$BLANK          \
--separator-color=$BLISS     \
\
--verif-color=$BLISS         \
--wrong-color=$BLISS         \
--time-color=$BLISS          \
--date-color=$BLISS          \
--layout-color=$BLISS        \
--keyhl-color=$WRONG         \
--bshl-color=$WRONG          \
\
--blur 20                    \
--clock                      \
--indicator                  \
--radius=82                  \
--ring-width=5.0             \
--time-str="%H:%M:%S"        \
--date-str="%A, %m %Y"       \
\
--verif-text="Hold on..."    \
--wrong-text="Booooooo !"    \
--noinput-text=" "           \
\
--nofork                    \
# --image=/tmp/crptd.png
# --pass{media, screen, power, volume}-keys
# --no-unlock-indicator
#--image="/home/xevil/Wallpapers/Sanime/"    \
#-Fek                         \
#--slideshow-random-selection \
