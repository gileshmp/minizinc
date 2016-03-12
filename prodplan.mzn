% The number of products
int : nproducts;

set of int: PRODUCT = 1..nproducts;

% Profit per unit product
array[PRODUCT] of float : profit;

%Number of Resources
int : nresources;
set of int: RESOURCE = 1..nresources;

%Amount of each resource 
array[RESOURCE] of float : capacity;

%Units of each resouce required for 1 unit of product
array[PRODUCT,RESOURCE] of float : consumption;

%How much to produce
float: m = max()
array[PRODUCT] of var float : produce;

%Non negativity
constraint forall (p in PRODUCT) (produce[p] >= 0.0);

%Capacity constraints
constraint forall (r in RESOURCE) 
	(sum (p in PRODUCT) (consumption[p,r] * produce[p]) <= capacity[r] );

%Maximize profit
solve maximize sum(p in PRODUCT) (profit[p]*produce[p]);

output[show(produce)];

  
