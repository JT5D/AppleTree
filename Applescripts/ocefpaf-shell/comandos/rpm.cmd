# install and update
rpm -Uhvv package.rpm

# info
rpm –q package.rpm
rpm -qa | grep "regexpr" # all

# which rpm pack does file belong to
rpm -qf /usr/bin/file

# lcoate docs
rpm -qdf /usr/bin/file

# info about installed pack
rpm -qip package.rpm

# list files in pack
rpm -qlp package.rpm

# list dependencies
rpm -qRp package.rpm

# find out state
rpm -qsp package.rpm

# remove
rpm -ev package.rpm

# evaluate macro
rpm --eval %macro

# check macros
rpm --showrc

# extract rpm
rpm2cpio myrpmfile.rpm | cpio -idmv
unrpm myrpmfile.rpm
extract myrpmfile.rpm

# work dir
/usr/src/packages/SOURCES

# or create ~/.rpmmacros with
%_topdir /home/<your user here>/packages

# build all
rpmbuild -ba file.spec

# or step-by-step
rpmbuild -bp file.spec
rpmbuild -bc file.spec
rpmbuild -bi file.spec
rpmbuild -bl file.spec

# default flags
/usr/lib/rpm/rpmrc

# override default flags
echo 'export RPM_OPT_FLAGS=`echo $RPM_OPT_FLAGS | %{__sed} s/-O2/-Os/`'

# spec macros
usr/lib/rpm/macros

# override spec macros
%define _prefix /opt/netcdf3

# create a patch
diff -Naur old new > patch_file

# debug some erros
nm /usr/lib/libnetcdf.a | grep MOD

# debug
objdump -h libXxX.so

# libs
If your shared library resides in /opt/package/lib/libfoo.so.7 you do need the libfoo.la
