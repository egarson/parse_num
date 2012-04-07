# Introduction

parse\_num is a small library to parse atoms with a 'numeric' representation into the equivalent scalar.

For example, given the atom @seventy_five@, then `parse_num:parse(seventy_five)` returns the scalar 75.

# Range

parse\_num works with representations ranging from **zero** to **10^9 - 1** (or, *one less than one quadrillion*).

## Examples

1. `parse_num:parse(one)` %% returns 1

1. `parse_num:parse(two)` %% returns 2

1. `parse_num:parse(twice)` %% also returns 2

1. `parse_num:parse(two_thousand_three_hundred)` %% returns 2300

1. `parse_num:parse(twenty_three_hundred)` %% also returns 2300

1. `parse_num:parse(nine_billion_eight_hundred_and_seventy_million_six_hundred_thousand_and_one)` ;; returns 9870600001

parse\_num works with both 'grammatically correct' representations (e.g. "two_thousand_three_hundred" above) and 'colloquial' representations (e.g. "twenty-three hundred").

parse\num is also forgiving: you do not need to correctly employ @and@, for which there exists specific rules.

# Rationale

parse\_num is useful for **domain-specific language** development; I wrote it for just such a project [merlin](http://github.com/egarson/merlin) and thought it might be useful to others on its own.

_Rails_ provides a similar facility that uses Ruby symbols, and leverages it to good effect in their API.

# Defects

Please log any defects in the [Issue Tracker](https://github.com/egarson/parse\_num/issues).

# Todo

* floating-point numbers
* negative numbers

# License

Copyright (C) 2011 Edward Garson

Distributed under the terms of the MIT license as described by the included file MIT-LICENSE.
