# Specify your username and email address to your GIT repository.
git config --global user.name "GIT Admin"
git config --global user.email myemail@super.com

# Check config.
git config --list
cat ~/.gitconfig

# Create a project.
git init # at the proj dir

# Add all files in the proj dir.
git add .

# Commit
git commit -m 'Initial upload of the project.'

# Make it a "bare" repo.
git config --bool core.bare true  # needed to be able to 'push'
rm * # but the .git dir
# 

# Basics
git status
git log filename.ext
git diff
git add filename.ext
git commit
git commit -a # add and commit

# Alias
git config --global alias.st status
git config --global alias.ci commit
