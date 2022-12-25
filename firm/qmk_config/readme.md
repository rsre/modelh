Compatible with QMK Firmware 0.16.9

´´´sh
git clone https://github.com/qmk/qmk_firmware
git checkout 84c9d6ff39b92892c385c320f3d36145d71c9095
qmk setup -H $PWD
qmk config user.keyboard=modelr
qmk config user.keymap=default
qmk compile
qmk flash
´´