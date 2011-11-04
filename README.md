# formtastic-bootstrap

Two great tastes in one: Formtastic and the Twitter Bootstrap framework.


# About the Implementation

Way too much code copied from Formtastic (behavior and classes.)
Tried to mimic its code structure as much as possible.

## Getting Started

## Formtastic vs. Formtastic Bootstrap

### Major Difference in Behavior

* No "label" class on labels because Bootstrap uses this label for something else.
* 'input' label is in a different place because it makes Bootstrap behave correctly.
* Data and DateTime These are a series of dropdowns in Formtastic, but are just test fields in Bootstrap.

### Other

* Some of this was done in a pretty mechanical matter to get the tests to pass.  If you don't think the right thing is happening, let me know.
* Formtastic does more than Bootstrap lays out.  There were situations where I didn't know what to do (nested controls for example.)
* I've inferred what :boolean should do since there's no example of a single checkbox given.
* In some places the markup is tortuous (:boolean.)  Hopefully as Bootstrap evolves these can get simplified.

## Contributing to formtastic-bootstrap
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## To Do
* Field Types
 * Basic Formtastic
   * :check_boxes
   * :time_zone
   * :date
   * :datetime
   * :time
   * :file
   * :country
   * Fieldsets
 * Fancy Bootstrap
  * Multiple Select (or is this covered?)
  * Date Range
  * Prepend Text
  * Prepend Checkbox
  * Appended Checkbox
* Errors
 * List
 * Field
* Hints
* More tests
* Documentation
* Refactor :boolean, :radio, :check_boxes to use common "choices" code.


## Copyright

Copyright (c) 2011 Matthew Bellantoni. See LICENSE.txt for further details.

