%% author:zonomasa
%% example: 
%%    $ erl
%%    1> c(bsort).
%%    2> bsort:bubble([2,1,10,4,3]).
%%
-module(bsort).
-export([bsort/1]).
-export([bubble/1]).

bsort([H]) -> [H];
bsort(L) ->
    LAST = lists:last(bubble(L)),    % bubble()でソートしたリストから、最後の一つを抽出
    bsort(L -- [LAST]) ++ [LAST].    % 最後の一つ以外で再帰


bubble([H]) -> [H];
bubble(L) -> 
    [H,H2|T] = L,                    % 1番目、2番目を抽出
    if H > H2 -> [H2|bubble([H|T])]; % 1番目＞2番目なら2つを入れ替えて、先頭以外で再帰
       true  ->  [H|bubble([H2|T])]  % else文
    end.
