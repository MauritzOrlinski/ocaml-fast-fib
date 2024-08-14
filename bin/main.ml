open Big_int_Z

exception Incorrect_args of string

let rec fib_simple n = 
  if eq_big_int zero_big_int n then zero_big_int
  else if eq_big_int (unit_big_int) n then unit_big_int 
  else (add_big_int (fib_simple (sub_big_int n unit_big_int)) 
  (fib_simple (sub_big_int n (big_int_of_int 2))))


let fib (n:int) =
  let memo : Big_int_Z.big_int option array = Array.make (n + 1) None in
  let rec fib_helper n = 
    let n_int = int_of_big_int n in
    match memo.(n_int) with
    | Some result -> result
    | None -> let result = if eq_big_int zero_big_int n then zero_big_int 
        else if eq_big_int (unit_big_int) n then unit_big_int 
        else (add_big_int (fib_helper (sub_big_int n unit_big_int)) 
        (fib_helper (sub_big_int n (big_int_of_int 2)))) in
        memo.(n_int) <- Some result;
        result
  in
  let n_big = Big_int_Z.big_int_of_int n in 
  let result = fib_helper n_big in 
  result

let fib_iter (n:int) = 
  let rec fib_helper n prev1 prev2 = if n = 1 then prev1 else
    fib_helper (n - 1) (add_big_int prev1 prev2) prev1
  in
  fib_helper n unit_big_int zero_big_int

let time f x =
    let t = Sys.time() in
    let result = f x in
    result, t

let () =
  let l = (Array.length Sys.argv) in 
  if l != 2 then raise (Incorrect_args ("Expected 1 argument but recieved " ^ (string_of_int l) ^ " instead.")) else
  let num = int_of_string (Sys.argv.(1)) in 
  let f1, t1 = time fib_iter num in
  let f2, t2 = time fib num in
  let f3, t3 = if num > 50 then zero_big_int, 0. else time fib_simple (big_int_of_int num) in
  print_endline ("fib_iter: " ^ string_of_big_int f1 
      ^ "\nexec time: " ^ string_of_float t1 ^ "\nfib_memoization: " ^ string_of_big_int f2 
      ^ "\nexec time: " ^ string_of_float t2 ^ "\nfib_recursive (=0 for n > 50 to make as it takes to long): " 
      ^ string_of_big_int f3 ^ "\nexec time: " ^ string_of_float t3)


