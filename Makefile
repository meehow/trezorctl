all: venv
	venv/bin/pip install \
		pyinstaller==6.22.3 \
		trezor==0.20.2
	# RECORD files hold hashes of venv/bin scripts, whose shebangs contain
	# the absolute build path; they get bundled and break reproducibility
	rm -f venv/lib/python3*/site-packages/*.dist-info/RECORD

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
