# No symlinks to machine site-packages
virtualenv --no-site-packages --distribute MyProject

# Actived 
cd MyProject
source bin/activate

# Deactived
deactivate

# virtualenvwrapper
# Wrappers
mkvirtualenv   :: create a new virtualenv
rmvirtualenv   :: remove an existing virtualenv
workon         :: change the current virtualenv
add2virtualenv :: add external packages in a .pth file to current virtualenv
cdsitepackages :: cd into the site-packages directory of current virtualenv
cdvirtualenv   :: cd into the root of the current virtualenv
deactivate     :: deactivate virtualenv, which calls several hooks)

# Hooks
postmkvirtualenv
prermvirtualenv
postrmvirtualenv
postactivate
predeactivate
postdeactivate


# pip
pip search
pip install pack==1.4.5
pip install -r requeriments.txt
