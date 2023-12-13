
(** This file has been generated by the Catala compiler, do not edit! *)

open Runtime_ocaml.Runtime

[@@@ocaml.warning "-4-26-27-32-41-42"]

module Enum1 = struct
 type t =
    | Yes of unit
    | No of unit
    | Maybe of unit
  end

module S = struct
  type t = {sr: money; e1: Enum1.t}
end

module Str1 = struct
  type t = {fld1: Enum1.t; fld2: integer}
end

module S_in = struct
  type t = unit
end



let s (s_in: S_in.t) : S.t =
  let sr_: money = 
    try
      (handle_default
         {filename = ""; start_line=0; start_column=1;
           end_line=0; end_column=1; law_headings=[]}
         ([|(fun (_: unit) ->
               handle_default
                 {filename = ""; start_line=0; start_column=1;
                   end_line=0; end_column=1; law_headings=[]} ([||])
                 (fun (_: unit) -> true)
                 (fun (_: unit) -> money_of_cents_string "100000"))|])
         (fun (_: unit) -> false) (fun (_: unit) -> raise EmptyError))
    with
    EmptyError -> (raise (NoValueProvided
      {filename = "tests/test_modules/good/mod_def.catala_en"; start_line=16;
        start_column=10; end_line=16; end_column=12;
        law_headings=["Test modules + inclusions 1"]})) in
  let e1_: Enum1.t = 
    try
      (handle_default
         {filename = ""; start_line=0; start_column=1;
           end_line=0; end_column=1; law_headings=[]}
         ([|(fun (_: unit) ->
               handle_default
                 {filename = ""; start_line=0; start_column=1;
                   end_line=0; end_column=1; law_headings=[]} ([||])
                 (fun (_: unit) -> true) (fun (_: unit) -> Enum1.Maybe ()))|])
         (fun (_: unit) -> false) (fun (_: unit) -> raise EmptyError))
    with
    EmptyError -> (raise (NoValueProvided
      {filename = "tests/test_modules/good/mod_def.catala_en"; start_line=17;
        start_column=10; end_line=17; end_column=12;
        law_headings=["Test modules + inclusions 1"]})) in
  {S.sr = sr_; S.e1 = e1_}

let half_ : integer -> decimal =
  fun (x_: integer) -> o_div_int_int x_ (integer_of_string "2")
let () =
  Runtime_ocaml.Runtime.register_module "Mod_def"
    [ "S", Obj.repr s;
      "half", Obj.repr half_ ]
    "todo-module-hash"