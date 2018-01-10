external (|>) : 'a -> ('a ->'b) -> 'b = "%revapply"

let success result =
  let response = Rpc.success result in
  Printf.printf "%s" (Xmlrpc.string_of_response response)

let failure value =
  let response = Rpc.failure value in
  Printf.printf "%s" (Xmlrpc.string_of_response response)

let dispatch fn_table =
  if Array.length Sys.argv <> 2 then
    failwith "Incorrect number of arguments"
  else begin
    let call = Xmlrpc.call_of_string Sys.argv.(1) in
    if List.mem_assoc call.Rpc.name fn_table then begin
      let fn = List.assoc call.Rpc.name fn_table in
      let session_id = Rpc.string_of_rpc (List.nth call.Rpc.params 0) in
      let args =
        (match List.nth call.Rpc.params 1 with
         | Rpc.Dict dict -> dict
         | _ -> failwith "Arguments not supplied as a dict")
        |> List.map (fun (k, v) -> (k, Rpc.string_of_rpc v))
      in
      try
        let result = fn session_id args in
        success (Rpc.String result)
      with e ->
        failure (Rpc.String (Printexc.to_string e))
    end else
      failure (Rpc.Enum [
          Rpc.String "UNKNOWN_XENAPI_PLUGIN_FUNCTION";
          Rpc.String call.Rpc.name;
        ])
  end
