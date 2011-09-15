# Introduction

parse\_num is a simple library to translate atoms with a 'textual' representation of a number into the number itself.

parse\_num works with textual representations ranging from **one** to **trillions** (actually, *one less than one quadrillion* to be exact).

## Examples

`parse_num:parse(one)` ;; returns 1

`parse_num:parse(two_thousand_three_hundred)` ;; returns 2300

`parse_num:parse(twenty_three_hundred)` ;; also returns 2300

`parse_num:parse(nine_billion_eight_hundred_and_seventy_million_six_hundred_thousand_and_one)` ;; returns 9870600001

Note that parse_num works with both 'correct' textual representations (as in the second example above) and 'colloquial' representations (as in the third).

# Rationale

I needed this for a project I am actively developing, and thought to share it in case others find a use for it.

Ruby on Rails provides a similar facility, and leverages it to good effect in their API.

# Defects

On the off chance you find a defect (^_^), please put a ticket in at https://github.com/egarson/parse_num/issues.

# Todo

* floating-point numbers
* negative numbers

# License

Copyright (C) 2011 Edward Garson

Distributed under the MIT license as described in the included file MIT-LICENSE.txt.
