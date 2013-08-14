osc co yourproject/yourpackage
cd yourproject/yourpackage
quilt setup -v *spec
cd yourpackage-*/
quilt push -a # apply old patches
quilt new yourpackage-version_fixbuild.patch
quilt edit src/foo.c
quilt refresh

foo-fixbuild.patch will automatically be created in the parent dir.
if you work on a package which doesnt have a patch yet. you have to remember to
copy the patch from the patch directory to your package directory.

normally i rerun quilt setup once i got an initial patch.
there is also quilt pop so you can remove patches from your working
copy. but the docs have a lot more informations about this.

.quiltrc:
# Options passed to GNU diff when generating patches
QUILT_DIFF_OPTS="--show-c-function" 
# QUILT_DIFF_OPTS="" 
# Options passed to GNU patch when applying patches
#QUILT_PATCH_OPTS="--ignore-whitespace --unified-reject" 

# Options to pass to commands (QUILT_${COMMAND}_ARGS)
QUILT_PUSH_ARGS="--color=auto" 
QUILT_DIFF_ARGS="--color=auto" 
QUILT_REFRESH_ARGS="--backup -p0" 
QUILT_PATCH_OPTS="--unified-reject-files --backup" 
