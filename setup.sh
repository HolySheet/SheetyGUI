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
cp -a -n flutter-desktop/example/windows/. windows
cp -a -n flutter-desktop/example/linux/. linux
mv -a -n flutter-desktop/example/macos/. macos
rm -rf flutter-desktop

curl -L -O $(curl -s https://api.github.com/repos/RubbaBoy/HolySheet/releases/latest \
| grep "HolySheet.*.jar\"" \
| cut -d : -f 2,3 \
| tr -d \" \
| cut -d',' -f2)
