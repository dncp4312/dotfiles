#!/bin/sh

BLANK='#00000000'
CLEAR='#ffffff22'
WRONG='#ffffffff'
BLISS='#8a2be2ff'

i3lock \
--ignore-empty-password      \
--insidever-color=$CLEAR     \
--ringver-color=$BLISS       \
\
--insidewrong-color=$CLEAR   \
--ringwrong-color=$WRONG     \
--inside-color=$BLANK        \
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
--time-str="%H:%M:%S"        \
--date-str="%A, %m %Y"       \
\
--verif-text="Hold on..."    \
--wrong-text="Booooooo\!"    \
\
--nofork                    \
#--image="/home/xevil/Wallpapers/Sanime/"    \
#-Fek                         \
#--slideshow-random-selection \
