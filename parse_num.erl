-module(parse_num).
-export([parse/1]).
-define(magnitudes, [hundred, thousand, million, billion, trillion]).

parse(Expr) when is_atom(Expr) ->
    Filter = fun(E) -> E /= "and" andalso E /= "times" end,
    build_num(list_to_atom_list(lists:filter(Filter, string:tokens(atom_to_list(Expr), "_"))), 0, 1, 0).

build_num(Num=[H|Rest], SubTot, Coeff, Acc) ->
    case next_is_magnitude(Rest) of
        false ->
            case larger_magnitude_pending(Num) of
                false ->
                    build_num(Rest, 0, 1, Acc + Coeff * value(H));
                true ->
                    build_num(Rest, Coeff * value(H) + SubTot, 1, Acc)
            end;
        true ->
            build_num(Rest, 0, Coeff * value(H) + SubTot, Acc)
    end;

build_num([], SubTot, _, Acc) ->
    SubTot + Acc.

next_is_magnitude([Next|_]) ->
    lists:member(Next, ?magnitudes);
next_is_magnitude([]) ->
    false.

larger_magnitude_pending([H|Rest]) ->
    Val = value(H),
    lists:any(fun(M) -> Val < value(M) end, Rest).

list_to_atom_list(List) ->
    lists:map(fun(L) -> list_to_atom(L) end, List).

value(Num) when is_list(Num) ->
    value(list_to_atom(Num));

value(Num) when is_atom(Num) ->
    case Num of
        zero -> 0;
        one -> 1;
        once -> 1;
        two -> 2;
        twice -> 2;
        three -> 3;
        thrice -> 3;
        four -> 4;
        five -> 5;
        six -> 6;
        seven -> 7;
        eight -> 8;
        nine -> 9;
        ten -> 10;
        eleven -> 11;
        twelve -> 12;
        thirteen -> 13;
        fourteen -> 14;
        fifteen -> 15;
        sixteen -> 16;
        seventeen -> 17;
        eighteen -> 18;
        nineteen -> 19;
        twenty -> 20;
        thirty -> 30;
        forty -> 40;
        fifty -> 50;
        sixty -> 60;
        seventy -> 70;
        eighty -> 80;
        ninety -> 90;
        hundred -> 100;
        thousand -> 1000;
        million -> 1000 * 1000;
        billion -> 1000 * 1000 * 1000;
        trillion -> 1000 * 1000 * 1000 * 1000
    end.
