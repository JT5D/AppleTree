# OSC CREDENTIALS ARE STORE IN
~/.oscrc

# SHOW USAGE INFO ON A COMMAND
 osc help

# LIST EXISTING CONTENT ON THE SERVER
 osc ls                          # list projects
 osc ls Apache                   # list packages in a project
 osc ls Apache subversion        # list files of package of a project

# CHECK OUT CONTENT
 osc co Apache                   # entire project
 osc checkout home:ocefpaf
 osc co Apache subversion        # a package
 osc co Apache subversion foo    # single file

# UPDATE A WORKING DIRECTORY
 osc up
 osc up <directory>
 osc up *                        # from within a project dir, update all packages
 osc up                          # from within a project dir, update all packages
                                   AND check out all newly added packages

# UPLOAD CHANGED CONTENT
 osc ci                          # current dir
 osc ci <file1> <file2>          # only specific files
 osc ci <dir1> <dir2> ...        # multiple packages
 osc ci -m "updated foobar"      # specify a commit message

# SEE THE COMMIT LOG
 osc log

# SHOW THE STATUS (WHICH FILES HAVE BEEN CHANGED LOCALLY)
 osc st
 osc st <directory>

# CONFLICT STATE, AFTER MANUALLY RESOLVING THE PROBLEM, USE
 osc resolved <file>

# MARK FILES TO BE ADDED OR REMOVED ON THE NEXT 'CHECKIN'
 osc add foo
 osc rm foo

# ADD ALL NEW FILES IN LOCAL COPY AND REMOVES ALL DISAPPEARED FILES.
 osc addremove

# GENERATE A DIFF TO VIEW THE CHANGES
 osc diff [file]

# SHOW THE BUILD RESULTS OF THE PACKAGE
 osc results
 osc results <platform>

# SHOW THE LOG FILE OF A PACKAGE (YOU NEED TO BE INSIDE A PACKAGE DIRECTORY)
 osc buildlog <platform> <arch>
 osc buildlog openSUSE_11.4 i586 > log # download log

# SHOW THE URLS OF .REPO FILES WHICH ARE PACKAGES SOURCES FOR YUM/YAST/SMART
 osc repourls [dir]

# TRIGGER A PACKAGE REBUILD FOR ALL REPOSITORIES/ARCHITECTURES OF A PACKAGE
 osc rebuildpac [dir]

# BUILD A PACKAGE ON YOUR LOCAL PLATTFORM
 osc build <platform> <arch> <specfile> [--clean|--noinit|...]
 osc build openSUSE_11.4 i586 foo.spec; DONE
 osc build [highest enable repo]

# SHOW THE CONFIGURED PLATFORMS/BUILD TARGETS.
 osc platforms [project]

# SHOW THE POSSIBLE BUILD TARGETS FOR YOUR PROJECT.
 osc repos

# SHOW META INFORMATION
 osc meta prj <project>
 osc meta pkg <project> <package>
 osc meta user <username>
 osc meta prjconf <project>

# EDIT META INFORMATION
 osc meta prj -e <project>
 osc meta pkg -e <project> <package>
 osc meta prjconf -e <project>
 osc meta pkg -e home:ocefpaf <package> # create

# UPDATE PACKAGE META DATA WITH METADATA TAKEN FROM SPEC FILE
 osc updatepacmetafromspec <dir>

# LOCAL BUILD
1) visudo # add your user to sudoers
2) filipe ALL = NOPASSWD: /usr/bin/build
3) su-wrapper = sudo -> ~/.oscrc

destdir -> /var/tmp/osc-build-root/usr/src/packages/RPMS/
logdir  -> /var/tmp/osc-build-root/.build.log
--noinit # avoid the re-creation of the build environment with the option
--clean  # trigger a complete rebuild with the option

# PATTERN
osc meta pattern -e home:ocefpaf oceanography # create
osc meta pattern home:ocefpaf                 # list
osc meta pattern <project> <pattern>          # get
osc meta pattern --file <local_file> <project> <pattern> # submit an existing file

# OSC CHEAT SHEET
osc copypac home:user:subprj oldpac home:user:subprj new # copy project
osc linkpac home:user:subprj oldpac home:user:subprj new # link project

# EDIT PREFERENCES
osc meta -e prjconf home:ocefpaf
Prefer: <package>

# MANAGE KEY
1) osc signkey <yourproject> | gpg --import -
2) gpg --fingerprint <keyid>
3) osc signkey --extend <yourproject>
4) repeat 1 and 2