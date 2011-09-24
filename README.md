# Introduction

parse\_num is a small utility library to convert atoms that *represent* numbers into their numeric value. It works with representations ranging from **zero** to **10^9 - 1** (or, *one less than one quadrillion*).

## Examples

1. `parse_num:parse(one)` ;; returns 1

1. `parse_num:parse(two_thousand_three_hundred)` ;; returns 2300

1. `parse_num:parse(twenty_three_hundred)` ;; also returns 2300

1. `parse_num:parse(nine_billion_eight_hundred_and_seventy_million_six_hundred_thousand_and_one)` ;; returns 9870600001

Note that parse\_num works with both 'correct' representations (as in the second example above) and 'colloquial' representations (as in the third). parse\num is as forgiving as possible, e.g. you do not need to correctly place *and* (for which there exists specific rules in English!).

# Rationale

This sort of utility can be useful for **domain-specific language** development. I wrote it for just such a project and thought others might find it useful as well.

The Ruby on Rails framework provides a similar facility with Ruby symbols, and leverages it to good effect in their API.

# Defects

On the off chance you find a defect (^_^), please put a ticket in at https://github.com/egarson/parse\_num/issues.

# Todo

* floating-point numbers
* negative numbers

# License

Copyright (C) 2011 Edward Garson

Distributed under the MIT license as described in the included file MIT-LICENSE.txt.
