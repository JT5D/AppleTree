# Install.
sudo zypper in findutils-locate

# Database is located at.
/var/lib/locatedb

# Update database.
sudo updatedb

# Locate.
locate filename

# one-line display.
locate -0 filename

# Count.
locate -c filename

# Just file that exists.
locate -e

# Ignore case.
locate -i FileName

# Limit outputs.
locate -l 5 filename

# Change mlocate Database Location.
locate -d <new db path> <filename>
