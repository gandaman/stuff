POKY_TAG=dylan-9.0.0

git clone git://git.yoctoproject.org/poky yocto
cd yocto
git checkout $POKY_TAG
git checkout -b ivi

sed -i 's/^meta/#meta/' .gitignore
sed -i 's/^build/#build/' .gitignore
git add .gitignore

git submodule add git://git.yoctoproject.org/meta-ivi
git add .gitmodules meta-ivi
git commit -m "Add submodule meta-ivi"

git submodule add git://git.yoctoproject.org/meta-ti
git add .gitmodules meta-ti
git commit -m "Add submodule meta-ti"

