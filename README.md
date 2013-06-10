Library to simplify writing xapi plugins in OCaml

Build dependencies
------------------

* [obuild](https://github.com/vincenthz/obuild)
* [rpc](https://github.com/samoht/ocaml-rpc)

Usage
-----

Simple xapi plugin which waits a specified number of seconds, then returns the string "done":

```ocaml
let main _ args =
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
