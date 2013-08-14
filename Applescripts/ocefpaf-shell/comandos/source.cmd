# python
python setup.py config
python setup.py build
sudo /usr/sbin/checkinstall python setup.py install

# gcc
export CC=/usr/bin/gcc
export CXX=/usr/bin/g++
export F9X=/usr/bin/gfortran
export FC=/usr/bin/gfortran
export F90=/usr/bin/gfortran
export F77=/usr/bin/gfortran

# ifort
export FC=ifort
export F9X=ifort
export F77=ifort
export F90=ifort
export CPPFLAGS=-DpgiFortran # ifort

# optional flags (not used)
export FCFLAGS='-O3'
export CPPFLAGS='-DNDEBUG -Df2cFortran'
export CFLAGS='-O -fno-builtin'
export FFLAGS='-O3'
export CFLAGS=-O2 -g
export CFLAGS=-fPIC
export CFLAGS=-g
export CXXFLAGS=-O2 -g
export FFLAGS=-fno-second-underscore
export FCFLAGS=-fno-second-underscore

# compile
./configure
make -j2
make check
make test
sudo make install

# hdf5-1.8.3 -> ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-4/hdf5-1.8.3-snap2.tar.gz
# requires -> install zlib(-devel)
export CC=gcc
export CXX=g++
export F9X=gfortran
export CFLAGS="-fno-strict-aliasing"
./configure --prefix=/usr/local --enable-cxx --enable-fortran --enable-hl --with-ssl --with-szlib=/usr \
            --disable-static --enable-shared
#--disable-static --enable-shared
#--enable-static --disable-shared
make -j2
make check; make test
sudo make install

# netcdf-4.1 -> ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-4.1-beta2.tar.gz
export CPPFLAGS="-fPIC"
export FFLAGS="-fPIC"
export F90FLAGS="-fPIC"
export FCFLAGS="-fPIC"
./configure --prefix=/usr/local --with-hdf5=/usr/local --with-zlib=/usr --with-szlib=/usr  \
            --enable-netcdf-4 --with-udunits --enable-dap \
            --disable-static --enable-shared
#--disable-static --enable-shared
#--enable-static --disable-shared
#--with-libcf 
make -j2
make check; make test
sudo make install

# nco -> cvs -z3 -d:pserver:anonymous@nco.cvs.sf.net:/cvsroot/nco co -kk nco
export CFLAGS="-fPIC"
export CXXFLAGS="-fpermissive -fPIC"
export HAVE_NETCDF4_H=yes
export NETCDF4_ROOT=/usr/local
export NETCDF_INC=/usr/local/include
export NETCDF_LIB=/usr/local/lib
export HDF5_LIB_DIR=/usr/local/lib
./configure HAVE_ANTLR=yes --prefix=/usr/local --enable-udunits2 --enable-netcdf4 \
                           --enable-dap-netcdf --disable-dap-opendap
#--disable-static --enable-shared
#--enable-static --disable-shared
# old make -> cd bld
# with libnc-dap
make DAP_OPENDAP=Y NETCDF4=N UDUNITS2=Y allinone
# with netcdf4
export CPPFLAGS='-DENABLE_NETCDF4 -DHAVE_NETCDF4_H'
export NETCDF4_ROOT='/usr/local'
make SZ=Y GSL=Y DAP_NETCDF=Y DAP_OPENDAP=N NETCDF4=Y UDUNITS2=Y allinone

# OpenMPI version 1.2.5
# Note: --disable-mpi-profile is because of a poorly linked file in the profiling directory (the link refers to the parent directory instead of a file).
./configure --prefix=/opt/openmpi --disable-mpi-profile

# libdap-3.9.3 -> http://www.opendap.org/pub/source/libdap-3.9.3.tar.gz
# need the patch
# requires -> dejagnu, libtool, libcurl(-devel), libxml2(-devel), cppunit(-devel), doxygen, graphviz, zlib(-devel), pkgconfig, automake
./configure --prefix=/usr/local

# libnc-dap-3.7.4 -> http://www.opendap.org/pub/source/libnc-dap-3.7.4.tar.gz
# requires -> libdap(-devel)
# only works with gcc44
./configure --prefix=/usr/local