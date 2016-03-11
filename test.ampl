int: num_cuts = 3;
array[1..num_cuts] of int:  cuts;  
int: num_comb = 6;
array[1..num_comb, 1..num_cuts] of int: combinations;
array[1..num_cuts] of int: demand;
array[1..num_comb] of var int: x;
var int: total_sum = sum(i in 1..num_comb) (x[i]);

solve minimize total_sum;
% solve satisfy;

constraint
  forall(i in 1..num_comb) (
    x[i] >= 0
  )
  /\
  forall(j in 1..num_cuts) (
     sum(i in 1..num_comb) 
       (combinations[i,j]*x[i]) >= demand[j]
  )
;

%
% Data
%
combinations =
array2d(1..num_comb, 1..num_cuts, [
  5, 0, 0,
  4, 1, 0,
  2, 2, 0,
  2, 0, 1,
  1, 1, 1,
  0, 3, 0
]);

cuts = [3,5,9];
demand =  [25, 20, 15];

output
[
  "x: " ++ show(x) ++ "\n" ++
  "total_sum: " ++ show(total_sum)
];