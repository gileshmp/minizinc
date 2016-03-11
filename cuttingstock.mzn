%[label=cutstock.base.zinc]
int: L;         % length of stock
int: K;         % Upper bound on the number of pieces
set of int: Sheets : symmetry = 1..K;   

int: N;         % Number of pieces
set of int: Items = 1..N; %

array[Items] of int: i_length;
array[Items] of int: i_demand;

array[Sheets] of var 0..1:                    sheets;
array[Sheets,Items] of var 0..max(i_demand):  items;
 
%demand constraints
constraint
    forall(i in Items) (sum(k in Sheets) (items[k,i] >= i_demand[i] );

% the items have to fit onto the stock piece
constraint
    forall(k in Sheets) (sum(i in Items) (items[k,i] * i_length[i] ) <= sheets[k] * L ) ;

solve :: search minimize sum(k in Sheets) (sheets[k]);


