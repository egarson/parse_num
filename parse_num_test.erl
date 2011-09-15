-module(parse_num_test).
-include_lib("eunit/include/eunit.hrl").
-import(parse_num, [parse/1]).

%%-define(parse_test(expected, value) -> TODO and replace all below:

once_test()                                       -> ?assertEqual(1, parse(once)).
twice_test()                                      -> ?assertEqual(2, parse(twice)).
thrice_test()                                     -> ?assertEqual(3, parse(thrice)).
three_test()                                      -> ?assertEqual(3, parse(three)).
four_test()                                       -> ?assertEqual(4, parse(four)).
ten_test()                                        -> ?assertEqual(10, parse(ten)).
twenty_test()                                     -> ?assertEqual(20, parse(twenty)).
twenty_one_test()                                 -> ?assertEqual(21, parse(twenty_one)).
twenty_nine_test()                                -> ?assertEqual(29, parse(twenty_nine)).
thirty_test()                                     -> ?assertEqual(30, parse(thirty)).
thirty_one_test()                                 -> ?assertEqual(31, parse(thirty_one)).
thirty_three_test()                               -> ?assertEqual(33, parse(thirty_three_times)).
ninety_nine_test()                                -> ?assertEqual(99, parse(ninety_nine)).
one_hundred_test()                                -> ?assertEqual(100, parse(one_hundred)).
two_hundred_two_test()                            -> ?assertEqual(202, parse(two_hundred_and_two)).
two_hundred_sixty_nine_test()                     -> ?assertEqual(269, parse(two_hundred_and_sixty_nine)).
three_hundred_and_eighty_six_test()               -> ?assertEqual(386, parse(three_hundred_and_eighty_six)).
nine_hundred_ninety_nine_test()                   -> ?assertEqual(999, parse(nine_hundred_and_ninety_nine)).
one_thousand_and_one_test()                       -> ?assertEqual(1001, parse(one_thousand_and_one)).
two_thousand_three_hundred_test()                 -> ?assertEqual(2300, parse(two_thousand_three_hundred)).
two_hundred_three_thousand_test()                 -> ?assertEqual(203000, parse(two_hundred_three_thousand)).
two_thousand_four_hundred_test()                  -> ?assertEqual(2400, parse(two_thousand_four_hundred)).
one_thousand_nine_hundred_and_seven_test()        -> ?assertEqual(1907, parse(one_thousand_nine_hundred_and_seven)).
twenty_thousand_test()                            -> ?assertEqual(20000, parse(twenty_thousand)).
one_hundred_twenty_three_thousand_test()          -> ?assertEqual(123000, parse(one_hundred_twenty_three_thousand)).
two_hundred_twenty_two_thousand_test()            -> ?assertEqual(222000, parse(two_hundred_twenty_two_thousand)).
one_hundred_thousand_and_ninety_nine_test()       -> ?assertEqual(100099, parse(one_hundred_thousand_and_ninety_nine)).
one_hundred_and_nine_thousand_and_one_test()      -> ?assertEqual(109001, parse(one_hundred_and_nine_thousand_and_one)).
four_hundred_and_six_thousand_five_hundred_test() -> ?assertEqual(406500, parse(four_hundred_and_six_thousand_five_hundred)).
one_hundred_and_eighty_thousand_test()            -> ?assertEqual(180000, parse(one_hundred_and_eighty_thousand)).
seven_hundred_and_eighty_thousand_fifty_test()    -> ?assertEqual(780050, parse(seven_hundred_and_eighty_thousand_fifty)).
one_million_and_ninety_nine_test()                -> ?assertEqual(1000099, parse(one_million_and_ninety_nine)).
nine_hundred_and_ninety_nine_million_test()       -> ?assertEqual(999 * 1000 * 1000, parse(nine_hundred_and_ninety_nine_million)).

nine_hundred_and_eighty_nine_million_and_nine_test() ->
    ?assertEqual(989 * 1000 * 1000 + 9, parse(nine_hundred_and_eighty_nine_million_and_nine)).

nine_hundred_and_fifty_nine_million_nine_hundred_and_forty_nine_thousand_test() ->
    ?assertEqual(959 * 1000 * 1000 + 949 * 1000, parse(nine_hundred_fifty_nine_million_nine_hundred_forty_nine_thousand)).

nine_hundred_ninety_nine_million_nine_hundred_ninety_nine_thousand_nine_hundred_and_nintey_nine_test() ->
    ?assertEqual(999*1000*1000+999*1000+999,
                 parse(nine_hundred_ninety_nine_million_nine_hundred_ninety_nine_thousand_nine_hundred_and_ninety_nine)).
