Black [1]
=========

A simple HTTP and Websocket library written in Ada with minimal external dependencies.

You can find examples (well, right now only one) for Black in the examples repository [4].


Dependencies
------------

- GNU Make
  + for build management.
- GNAT
  + as we haven't written build scripts for other compilers yet.
- Ahven
  + for testing.
- libesl
  + for URL encoding and decoding.
- Bash
  + for managing test cases.


Requirements
------------

Requirements for the library are kept as [issues](https://github.com/sparre/Black/issues?labels=requirement) under the project on GitHub.


Included tests
--------------

1. 'unused_units' - warns about units which aren't compiled.
2. 'ahven' - unit tests.
3. 'task_interfaces_and_extended_return' - testing for a bug in GNAT.


Links
-----

If you want to find free Ada tools or libraries AdaIC [2] is an excellent
starting point.  You can also take a look at the other source text
repositories belonging to Jacob Sparre Andersen [3].

1. Source text repository:
   https://github.com/sparre/Black
2. Free Ada Tools and Libraries:
   http://www.adaic.org/ada-resources/tools-libraries/
3. Jacob Sparre Andersen's repositories on Bitbucket:
   http://repositories.jacob-sparre.dk/
4. Examples for Black:
   https://github.com/sparre/Black-examples

