Compatible with QMK Firmware 0.19.5

´´´sh
git clone https://github.com/qmk/qmk_firmware
git checkout ab1898e6600fe0f4f4a74ac26cb2d25c6f736161
qmk setup -H $PWD
qmk config user.keyboard=modelr
qmk config user.keymap=default
qmk compile
qmk flash
´´´

Remeber to do ´make git-submodule´ if changing versions!