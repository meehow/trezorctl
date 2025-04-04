# Trezor Setup

- Download trezorctl.zip from [actions](https://github.com/meehow/trezorctl/actions). 

    Build steps are designed to be reproducible. Building on different machines should produce identical binaries.

- Download [udev rules](https://data.trezor.io/udev/51-trezor.rules)

- Download firmware suitable for your device
    > ./trezorctl firmware download
    - You can also download firmware file directly. I.e. by the time of writing, the newest version for Trezor Safe 3 was: https://data.trezor.io/firmware/t2b1/trezor-t2b1-2.8.9.bin

        sha256sum: 437916c8af0a7cd64c2a7c6ac34ca7a249293ff397b68c1f2b560eca6dddb17a

- Authenticity of the device can be verified only online
    > ./trezorctl device authenticate

- Install udev rules

    > sudo cp 51-trezor.rules /etc/udev/rules.d/

- Update firmware (filename of firmware for your device can be different)

    > ./trezorctl firmware update -f trezor-t2b1-2.8.9.bin

- Start setup process

    > ./trezorctl device setup -b shamir

- Derive first Bitcoin address

    > ./trezorctl btc get-address -n m/44h/0h/0h/0/0

- Verify address on the device

    > ./trezorctl btc get-address -n m/44h/0h/0h/0/0 -d
