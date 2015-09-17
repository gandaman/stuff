#!/bin/sh

GIT_ANNEX_REMOTE_NAME_1=localfiles
GIT_ANNEX_REMOTE_URL_1=file:///home/user/annex/gdp-source

die() { echo "Something failed. Message:" ; echo "$@" ; exit 1 ; }

git clone --recursive https://github.com/gunnarx/genivi-demo-platform -b minnowboard_with_source || die "clone failed"

# Now download content for gdp-source
cd genivi-demo-platform/gdp-source 

# Hook up content server for git annex
git remote add $GIT_ANNEX_REMOTE_NAME_1 $GIT_ANNEX_REMOTE_URL_1 || die "remote add"

# Copy actual content
git annex copy --from $GIT_ANNEX_REMOTE_NAME_1 || die "copy sources failed from $GIT_ANNEX_REMOTE_NAME_1 ($GIT_ANNEX_REMOTE_URL_1)"

# Check: There should be zero missing files now
missing=$(git annex find --not --in here | wc -l)
if [ "$missing" -ne 0 ] ; then
   die "Apparently missing $missing files"
fi

cd ..

. ./init.sh

bitbake genivi-demo-platform

exit 0
