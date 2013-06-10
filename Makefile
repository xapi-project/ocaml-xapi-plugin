.PHONY: install uninstall clean

dist/build/lib-xapi_plugin/xapi_plugin.cmxa:
	obuild configure
	obuild build

install:
	ocamlfind install xapi-plugin lib/META \
		$(wildcard dist/build/lib-xapi_plugin/*)

uninstall:
	ocamlfind remove xapi-plugin

clean:
	rm -rf dist
