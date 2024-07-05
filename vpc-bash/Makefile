clean:
	rm -fr *.zip extensions/ tmp/

extensions/lamux: clean
	mkdir -p extensions tmp
	wget -q -O tmp/lamux.tar.gz https://github.com/fujiwara/lamux/releases/download/v0.0.10/lamux_0.0.10_linux_amd64.tar.gz
	cd tmp && tar xzf lamux.tar.gz
	install tmp/lamux extensions/lamux

layer.zip: extensions/lamux
	zip -r layer.zip extensions

publish-layer: layer.zip
	aws lambda publish-layer-version \
		--layer-name lamux \
		--zip-file fileb://layer.zip \
		--compatible-runtimes provided.al2023 provided.al2
