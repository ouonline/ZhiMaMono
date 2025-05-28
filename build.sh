#!/bin/bash

font='ZhiMaMono'

# we are in Iosevka now
function disable_all_features() {
    fpath='packages/font-otl/src/index.ptl'
    sed -i '/Gr.Lnum$/s/^/#/' $fpath
    sed -i '/Gr.Onum$/s/^/#/' $fpath
    sed -i '/Gr.NumeratorForm$/s/^/#/' $fpath
    sed -i '/Gr.DenominatorForm$/s/^/#/' $fpath
    sed -i '/buildFrac/s/^/#/' $fpath
    sed -i '/buildGsubThousands/s/^/#/' $fpath
    sed -i '/buildLOCL/s/^/#/' $fpath
}

if ! [ -d Iosevka ]; then
    git clone --depth 1 https://github.com/be5invis/Iosevka.git
    cd Iosevka
    disable_all_features
    npm install
    cd -
fi

cp private-build-plans.toml Iosevka
cd Iosevka
npm run build -- ttf::$font
cp dist/$font/TTF/$font-Regular.ttf ..
cd -

echo "font \`$font\` generated."
