#!/bin/bash

font='ZhiMaMono'

if ! [ -d Iosevka ]; then
    git clone --depth 1 https://github.com/be5invis/Iosevka.git
    cd Iosevka
    npm install
    cd -
fi

cp private-build-plans.toml Iosevka
cd Iosevka
npm run build -- ttf::$font
cp dist/$font/TTF/$font-Regular.ttf ..
cd -

echo "font \`$font\` generated."
