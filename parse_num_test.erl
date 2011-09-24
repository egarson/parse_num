-module(parse_num_test).
-compile(export_all).
-include_lib("eunit/include/eunit.hrl").
-import(parse_num, [parse/1]).

-define(log(X,Y), io:format(X,Y)).

gen_test_() ->
    gen(199).
gen(N) when N > 0 ->
    {generator, fun() -> [?_assertEqual(N, parse(num_to_atom_num(N))) | gen(N-1)] end};
gen(0) ->
    [].

%% Given num_to_atom_num(123) return one_hundred_twenty_three
num_to_atom_num(N) ->
    num_to_atom_num(integer_to_list(N), []).

num_to_atom_num([First|Rest], Nums) -> %%when length(Rest) > 0 ->
    NumDigits = string:len(Rest) + 1,
    Factor = trunc(math:pow(10, NumDigits-1)),
    {FirstNum,_} = string:to_integer([First]),
    PosVal = FirstNum * Factor,
    ?log("FirstNum-~w NumDigits-~p Factor-~p PosVal-~w Nums-~p~n", [FirstNum, NumDigits, Factor, PosVal, Nums]),
    if PosVal > 0 ->
        num_to_atom_num(Rest, [PosVal|Nums]);
        true -> num_to_atom_num(Rest, Nums)
    end;

num_to_atom_num(_, Nums) ->
    ?log("Nums-~p~n", [Nums]),
    list_to_atom(string:join([atom_to_list(num_to_atom(N)) || N <- lists:reverse(Nums)], "_")).
    %% list_to_atom(string:join(lists:map(fun(N) -> num_to_atom(N) end, lists:reverse(Nums)), "_")).

num_to_atom(N) ->
    case N of
        0 -> zero;
        1 -> one;
        2 -> two;
        3 -> three;
        4 -> four;
        5 -> five;
        6 -> six;
        7 -> seven;
        8 -> eight;
        9 -> nine;
        10 -> ten;
        11 -> eleven;
        12 -> twelve;
        13 -> thirteen;
        14 -> fourteen;
        15 -> fifteen;
        16 -> sixteen;
        17 -> seventeen;
        18 -> eighteen;
        19 -> nineteen;
        20 -> twenty;
        30 -> thirty;
        40 -> forty;
        50 -> fifty;
        60 -> sixty;
        70 -> seventy;
        80 -> eighty;
        90 -> ninety;
        100 -> hundred;
        1000 -> thousand;
        1000 * 1000 -> million;
        1000 * 1000 * 1000 -> billion;
        1000 * 1000 * 1000 * 1000 -> trillion
    end.

parse_test_() ->
    [
     ?_assertEqual(0, parse(zero)),
     ?_assertEqual(1, parse(once)),
     ?_assertEqual(2, parse(twice)),
     ?_assertEqual(3, parse(thrice)),
     ?_assertEqual(3, parse(three)),
     ?_assertEqual(4, parse(four)),
     ?_assertEqual(10, parse(ten)),
     ?_assertEqual(20, parse(twenty)),
     ?_assertEqual(21, parse(twenty_one)),
     ?_assertEqual(29, parse(twenty_nine)),
     ?_assertEqual(30, parse(thirty)),
     ?_assertEqual(31, parse(thirty_one)),
     ?_assertEqual(33, parse(thirty_three_times)),
     ?_assertEqual(99, parse(ninety_nine)),
     ?_assertEqual(100, parse(one_hundred)),
     ?_assertEqual(202, parse(two_hundred_and_two)),
     ?_assertEqual(269, parse(two_hundred_and_sixty_nine)),
     ?_assertEqual(386, parse(three_hundred_and_eighty_six)),
     ?_assertEqual(999, parse(nine_hundred_and_ninety_nine)),
     ?_assertEqual(1001, parse(one_thousand_and_one)),
     ?_assertEqual(2300, parse(two_thousand_three_hundred)),
     ?_assertEqual(203000, parse(two_hundred_three_thousand)),
     ?_assertEqual(2400, parse(two_thousand_four_hundred)),
     ?_assertEqual(1907, parse(one_thousand_nine_hundred_and_seven)),
     ?_assertEqual(20000, parse(twenty_thousand)),
     ?_assertEqual(123000, parse(one_hundred_twenty_three_thousand)),
     ?_assertEqual(222000, parse(two_hundred_twenty_two_thousand)),
     ?_assertEqual(100099, parse(one_hundred_thousand_and_ninety_nine)),
     ?_assertEqual(109001, parse(one_hundred_and_nine_thousand_and_one)),
     ?_assertEqual(406500, parse(four_hundred_and_six_thousand_five_hundred)),
     ?_assertEqual(180000, parse(one_hundred_and_eighty_thousand)),
     ?_assertEqual(780050, parse(seven_hundred_and_eighty_thousand_fifty)),
     ?_assertEqual(1000099, parse(one_million_and_ninety_nine)),
     ?_assertEqual(999 * 1000 * 1000, parse(nine_hundred_and_ninety_nine_million)),
     ?_assertEqual(989 * 1000 * 1000 + 9, parse(nine_hundred_and_eighty_nine_million_and_nine)),
     ?_assertEqual(959 * 1000 * 1000 + 949 * 1000,
                   parse(nine_hundred_fifty_nine_million_nine_hundred_forty_nine_thousand)),
     ?_assertEqual(999*1000*1000+999*1000+999,
                   parse(nine_hundred_ninety_nine_million_nine_hundred_ninety_nine_thousand_nine_hundred_and_ninety_nine))
    ].
