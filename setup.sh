mkdir flutter-desktop
cd flutter-desktop
git init
git remote add origin -f https://github.com/google/flutter-desktop-embedding.git
git config core.sparsecheckout true
echo "example/windows/*" >> .git/info/sparse-checkout
echo "example/linux/*" >> .git/info/sparse-checkout
echo "example/macos/*" >> .git/info/sparse-checkout
git pull origin master
cd ..
mv flutter-desktop/example/windows windows
mv flutter-desktop/example/linux linux
mv flutter-desktop/example/macos macos
rm -rf flutter-desktop
