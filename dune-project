(lang dune 2.7)

(generate_opam_files true)

(name "xapi-plugin")

(source (github xapi-project/ocaml-xapi-plugin))
(license "LGPL-2.1-only WITH OCaml-LGPL-linking-exception")
(authors "xen-api@lists.xen.org")
(maintainers "Xapi project maintainers")
(homepage "https://xapi-project.github.io/")

(package
  (name xapi-plugin)
  (synopsis "Library to simplify writing xapi plugins in OCaml")
  (depends base-unix rpclib)
)
