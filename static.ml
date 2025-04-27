
let mean lst =
  let total = List.fold_left (+) 0 lst in
  float_of_int total /. float_of_int (List.length lst)

let median lst =
  let sorted = List.sort compare lst in
  let len = List.length sorted in
  if len mod 2 = 0 then
    let mid1 = List.nth sorted (len / 2 - 1) in
    let mid2 = List.nth sorted (len / 2) in
    float_of_int (mid1 + mid2) /. 2.0
  else
    float_of_int (List.nth sorted (len / 2))

let mode lst =
  let count_map =
    List.fold_left (fun acc x ->
      if List.mem_assoc x acc then
        (x, List.assoc x acc + 1) :: List.remove_assoc x acc
      else
        (x, 1) :: acc
    ) [] lst in
  let max_freq = List.fold_left (fun m (_, c) -> max m c) 0 count_map in
  List.fold_right (fun (k, v) acc -> if v = max_freq then k :: acc else acc) count_map []

let () =
  let data = [10; 20; 20; 30; 40; 40; 40; 50] in
  Printf.printf "Mean: %.2f\n" (mean data);
  Printf.printf "Median: %.2f\n" (median data);
  Printf.printf "Mode: ";
  List.iter (fun x -> Printf.printf "%d " x) (mode data);
  print_newline ()
