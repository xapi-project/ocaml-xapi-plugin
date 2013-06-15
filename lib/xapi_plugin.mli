val dispatch : (string * (string -> (string * string) list -> string)) list -> unit
(** [dispatch fn_table] attempts to extract a function name, xapi session ID
 *  and list of key-value pair arguments from the first command-line argument,
 *  which is expected to be in XMLRPC format.
 *
 *  If the function name is present as a key in [fn_table], then the
 *  corresponding function in the table will be called with the xapi session ID
 *  and the key-value pair list as arguments.
 *
 *  The function from [fn_table] will return a string, which will be wrapped up
 *  as an XMLRPC response and written to stdout.
 *
 *  The functions in [fn_table] should not write anything to stdout, otherwise
 *  xapi will not be able to parse the response. *)
