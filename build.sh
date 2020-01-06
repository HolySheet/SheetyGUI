# Building to build/windows/x64/Release/Runner

flutter build windows

# Moving build/windows/x64/Release/Runner to build/windows/x64/Release/temp

cd build/windows/x64/Release

mkdir temp
cp -a Runner/. temp
cd temp

# Downloading HolySheet.jar to the directory to compress

curl -L -O $(curl -s https://api.github.com/repos/RubbaBoy/HolySheet/releases/latest \
| grep "HolySheet.*.jar\"" \
| cut -d : -f 2,3 \
| tr -d \" \
| cut -d',' -f2)

# Compressing to build/windows/x64/Release/HolySheet.zip

git init
git add .
git commit --quiet --no-gpg-sign -m commit
git archive -o ../HolySheet.zip @
cd ..
rm -rf temp

# Moving to build/HolySheet.zip

mv HolySheet.zip ../../../

echo 'Created build/HolySheet.zip'
