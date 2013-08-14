# execute
screen command-to-be-executed

# detach from terminal
# Detach Method 1: CTRL+A d
# Detach Method 2: using -d option

# bring back the screen
screen -d SCREENID

# list running screen processes
screen -ls
#There is a screen on:
#	4491.pts-2.FC547	(Attached)
#1 Socket in /var/run/screen/S-sathiya.
screen -d 4491.pts-2.FC547
#[4491.pts-2.FC547 detached.

# Attach the Screen
screen -r 4491.pts-2.FC547
