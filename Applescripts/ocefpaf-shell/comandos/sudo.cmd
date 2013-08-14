# access to an user
ocefpaf    ALL=(ALL) ALL

# access to a group
%programmers    ALL=(ALL) ALL

# forgot sudo vim?
:w !sudo tee %

# forgot sudo for a comand you just typed
sudo !!

# same as su (!?)
sudo bash

# log with unauthorized use
/var/log/auth.log
