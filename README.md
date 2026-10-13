# Trezor Setup

- Download `trezorctl` from [releases](https://github.com/meehow/trezorctl/releases/latest) and make it executable (`chmod +x trezorctl`).

    Build steps are designed to be reproducible. Building on different machines should produce identical binaries.

- Download [udev rules](https://data.trezor.io/udev/51-trezor.rules)

- Install udev rules
    > sudo cp 51-trezor.rules /etc/udev/rules.d/

- Download firmware suitable for your device
    > ./trezorctl firmware download
    - You can also download firmware file directly. I.e. by the time of writing, the newest version for Trezor Safe 3 was: https://data.trezor.io/firmware/t2b1/trezor-t2b1-2.12.5.bin

        sha256sum: 7abd72b2be837b3d1f1f9ac5246f9a3e3e3ae83a562599a6e20eb2fea3fbfd37

- Verify firmware signature and fingerprint. The fingerprint is also shown on the device during update.
    > ./trezorctl firmware verify trezor-t2b1-2.12.5.bin

        Firmware fingerprint: ec7d7c45053f5ade66c362d338aa57aaa018d234d3810ea9d1cec44c6a60c70e

- Authenticity of the device can be verified only online
    > ./trezorctl device authenticate

- Update firmware (filename of firmware for your device can be different)

    > ./trezorctl firmware update -f trezor-t2b1-2.12.5.bin

- Start setup process

    > ./trezorctl device setup -b shamir

- Derive first Bitcoin address

    > ./trezorctl btc get-address -n m/44h/0h/0h/0/0

- Verify address on the device

    > ./trezorctl btc get-address -n m/44h/0h/0h/0/0 -d
