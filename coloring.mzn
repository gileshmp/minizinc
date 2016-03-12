% Map coloring
%
%         /------------------\
%     ---/   |        |       |___
%     |  T1  |   T2   |    T5     \
%     |______/________|____________|
%     |   |              |        /
%     |   |     T4       |  T7___/
%     |T3 |--------------|    |
%      \__|      T6      |___/
%         \______________/

% Author : Gilesh M P (NIT Calicut)

int: col = 4;

var 0..col: T1;
var 0..col: T2;
var 0..col: T3;
var 0..col: T4;
var 0..col: T5;
var 0..col: T6;
var 0..col: T7;

constraint T1 != T2;
constraint T1 != T3;
constraint T1 != T4;
constraint T2 != T4;
constraint T2 != T5;
constraint T3 != T4;
constraint T3 != T6;
constraint T4 != T6;
constraint T4 != T7;
constraint T4 != T5;
constraint T5 != T7;
constraint T6 != T7;

solve satisfy;

output ["T1=\(T1)  T2=\(T2)  T3=\(T3)  T4=\(T4)  T5=\(T5)  T6=\(T6)  T7=\(T7)"]
