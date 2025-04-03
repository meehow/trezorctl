all: venv
	venv/bin/pip install \
		pyinstaller==6.12.0 \
		trezor==0.13.10

	PYTHONHASHSEED=1 \
	venv/bin/pyinstaller \
		--strip \
		--onefile \
		--copy-metadata slip10 \
		--collect-data shamir_mnemonic \
		venv/bin/trezorctl

venv:
	python3 -m venv venv

deps:
	sudo apt install python3-dev binutils

clean:
	rm -rf $(shell cat .gitignore)
