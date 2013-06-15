Library to simplify writing xapi plugins in OCaml

Build dependencies
------------------

* [obuild](https://github.com/vincenthz/obuild)
* [rpc](https://github.com/samoht/ocaml-rpc)

Usage
-----

Simple xapi plugin which waits a specified number of seconds, then returns the string "done":

```ocaml
let main session_id args =
  if List.mem_assoc "sleep" args then begin
    let time = float_of_string (List.assoc "sleep" args) in
    Thread.delay time
  end;
  "done"

let () =
  Xapi_plugin.dispatch [
    "main", main;
  ]
```

Compile with:

```
$ ocamlfind ocamlopt -thread -package rpclib -package xapi-plugin -linkpkg test_ocaml_plugin.ml -o test-ocaml-plugin
```

The resulting binary can be copied to `/etc/xapi.d/plugins` on an XCP/XenServer
host, and then run like so:

```
# xe host-call-plugin host-uuid=0775b809-2064-4b1c-9b20-c02cab711ac8 plugin=test-ocaml-plugin fn=main args:sleep=5
done
```
