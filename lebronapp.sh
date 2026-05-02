#!/usr/bin/env bash
mkdir -p ~/lebronapp.app/contents
cd ~/lebronapp.app/contents
mkdir MacOS Resources

curl "https://raw.githubusercontent.com/Very-cool-guy/lebron-virus/main/resources/info.plist" > info.plist

cd MacOS
echo "#!/usr/bin/env bash
tail -f /dev/null
" > applet
chmod +x applet

mkdir ~/lebron.iconset
sizes=(16 32 128 256 512)
for size in "${sizes[@]}"; do
        sips -z $size $size ~/lebron.png --out ~/Lebron.iconset/icon_${size}x${size}.png
        double_size=$((size * 2))
        sips -z $double_size $double_size ~/lebron.png --out ~/Lebron.iconset/icon_${size}x${size}@2x.png
done
iconutil -c icns ~/Lebron.iconset -o ~/lebronapp.app/contents/Resources/AppIcon.icns

touch ~/lebronapp.app

# curl "https://raw.githubusercontent.com/Very-cool-guy/lebron-virus/main/lebronmenubar.sh" | bash
