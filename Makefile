all: clean build test

clean:
	@(./rebar clean)

build:
	@(./rebar compile)

test:
	@(./rebar eunit)

.PHONY: deps test clean build
