## 0.10.16 2015-05-17

* No changes

## 0.10.15 2015-02-15

* Ruby 2.2 support
* Windows support on 2.1.x and 2.2.x

## 0.10.14 2014-02-13

* Don't do DNS lookup in transaction loading
* Allow for subsecond timestamp parsing

## 0.10.13 2013-05-27

* Windows binary for Ruby 2.0

## 0.10.12 2013-01-21

* jdbc-sqlite3 driver loading fix
* Improve handling of floats / doubles in sqlite3 on JRuby

## 0.10.11 2012-12-29

* Rename C symbols to prevent name collitions

## 0.10.10 2012-10-11

* Add support to C driver for busy\_timeout

## 0.10.9 2012-08-13

* Fix segfault when loading custom extensions

## 0.10.8 2012-02-10

* Ruby 1.9.3 compatibility on Windows
* Fix issue with sqlite3_load_extension

## 0.10.7 2011-10-13

* Ruby 1.9.3 compatibility

## 0.10.6 2011-05-22

Bugfixes
* Fix an issue on some platforms when multiple DO drivers are loaded

## 0.10.5 2011-05-03

Bugfixes
* Fix an issue with DateTime

## 0.10.4 2011-04-28

New features
* Add save point to transactions (all)
* JRuby 1.9 mode support (encodings etc.)

Bugfixes
* Fix bug when using nested transactions in concurrent scenarios (all)
* Use column aliases instead of names (jruby)
* DST calculation fixes (all)

Other
* Refactor to DRY up the adapters (all)
* Many style fixes
* Switch back to RSpec

## 0.10.3 2011-01-30
* Reworked transactions
* Fix a DST bug that could cause datetimes in the wrong timezone

## 0.10.2 2010-05-19
* Make Encoding.default_internal aware
* Rework logging for making callbacks possible
* Remove handling Object types directly

## 0.10.1.1 2010-01-24

* JRuby-only: Fix for handling boolean results with a TRUE value.

## 0.10.1 2010-01-08

* Support for Ruby 1.8 and 1.9 on Windows.
* Switch to Jeweler for Gem building tasks (this change may be temporary).
* Switch to using Bacon for running specs: This should make specs friendlier to
  new Ruby implementations that are not yet 100% MRI-compatible, and in turn,
  pave the road for our own IronRuby and MacRuby support.
* Switch to the newly added rake-compiler `JavaExtensionTask` for compiling
  JRuby extensions, instead of our (broken) home-grown solution.

## 0.10.0 2009-09-15
* Improvements
  * JRuby Support (using *do_jdbc*)

## 0.9.12 2009-05-17
* Improvements
  * rake-compiler for Windows support

## 0.9.11 2009-01-19
* Improvements
  * Ruby 1.9 support
* Fixes
  * Fix Windows gem

## 0.9.9 2008-11-27
* Improvements
  * Added cross compile rake tasks for Windows gems [Jonathan Stott, Luis Lavena]
  * Added initial support for Ruby 1.9 [John Harrison]

* Bug Fixes
  * Removed sqlite3.dll from source gem [Dan Kubb]
  * Removed hard coded .bundle from source [Dirkjan Bussink]
