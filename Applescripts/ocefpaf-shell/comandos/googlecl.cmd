Blogger
    * google blogger post --tags "GoogleCL, awesome" --title "Test Post" "I'm posting from the command line"
    * google blogger post blogpost.txt
    * google blogger list title,url-site # List posts
    * google blogger delete --title "Test Post"
    * google delete --title "Silly post number [0-9]*" # Delete posts matching regex
    * google tag --title "Dev post" --tags "Python, software" # label an existing post 

Calendar
    * google calendar add "Dinner party with George today at 6pm" # add event to calendar
    * google calendar today # List events for today only.
    * google calendar list --date 2010-06-01,2010-06-30 # List events.
    * google calendar delete --title "Dinner party with George" # Delete an event. 

Contacts
    * google contacts add "J. Random Hacker, jrandom@example.com"
    * google contacts list name,email --title "J. Random Hacker"
    * google contacts delete --title "J. Random Hacker" 

Docs
    * google docs delete --title "Evidence"
    * google docs list title,url-direct --delimiter ": " # list docs
    * google docs upload the_bobs.csv ~/work/docs_to_share/* 
    * google docs edit --title "Shopping list" --editor vim
    * google docs get --title "Homework [0-9]*" 
    * google docs edit --title "To-Do List" --editor vim

Picasa
    * google picasa create --title "Vermont Test" --tags Vermont vermont.jpg
    * google picasa get --title "Vermont Test" /path/to/download/folder
    * google picasa list title,url-direct --query "A tag"
    * google picasa post --title "Vermont Test" ~/old_photos/*.jpg # Add to an album
    * google picasa tag --title "Vermont Test" --tags "places"
    * google picasa delete --title "Vermont Test" # delete entire album 

Youtube
    * google youtube post --category Education --devtags GoogleCL killer_robots.avi
    * google youtube delete --title "killer_robots.avi"
    * google youtube list # list my videos
    * google youtube tag -n ".*robot.*" --tags robot 
