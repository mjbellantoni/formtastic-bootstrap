# Formtastic Bootstrap

A [Formtastic](https://github.com/justinfrench/formtastic) form builder that creates markup suitable for the [Twitter Bootstrap](http://twitter.github.com/bootstrap/) framework.  In theory, it should just work.  Two great tastes in one!

## Getting Started

### Dependencies

Formtastic Bootstrap has only been tested with Ruby 1.9.2, Rails 3.1, Formtastic 2.0 and Twitter Bootstrap 1.3.

### Installation

Install the gem with <tt>gem install formtastic-bootstrap</tt> or add it to your Gemfile:

    gem 'formtastic-bootstrap'

And install it with <tt>bundle install</tt>.

You will then need to add the following line to your Formtastic initialization file:

  # config/initializers/formtastic.rb
  Formtastic::Helpers::FormHelper.builder = FormtasticBootstrap::FormBuilder

## Formtastic vs. Formtastic Bootstrap


### Major Difference in Behavior

* No "label" class on labels because Bootstrap uses this label for another purpose (highlighting arbitrary text.)
* 'input' label is in a different place because it makes Bootstrap behave correctly.
* :date, :datetime and :time. These are a series of dropdowns in Formtastic, but are just test fields in Bootstrap.  You lose some of the automagic that (apparently) gets done.  [See if I can come up with a recommendation.]
  * Also, date at al are tagged with the 'stringish' class.
  * Don't have hidden fields for date.
* Fieldsets are simply nested.  List (li) elements are not inserted.
### Other

* Some of this was done in a pretty mechanical matter to get the tests to pass.  If you don't think the right thing is happening, let me know.
* Formtastic does more than Bootstrap lays out.  There were situations where I didn't know what to do (nested controls for example.)
* I've inferred what :boolean should do since there's no example of a single checkbox given.
* I've inferred what :datetime should do since there's not example of a single :datetime
* In some places the markup is tortuous (:boolean.)  Hopefully as Bootstrap evolves these can get simplified.
* Different html classes for sentence-based inline/block error messages.

## Contributing to formtastic-bootstrap
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## About the Implementation

A lot of the code (especially the test suite) was copied over from Formtastic and then beaten into submission.  I'm sure you'll find some ugliness in there.  In general, I mimicked the Formtastic code structure as much as possible.

### To Do
* Field Types
 * Basic Formtastic
   * :country
   * :time_zone
 * Fancy Bootstrap Fields
  * Date Range
  * Prepend Text
  * Prepend Checkbox
  * Appended Checkbox
* :datetime, :date, :time
 * As rich functionally as their Rails counterparts.
 * Extract into a standalone gem.
* Disabled inputs
* Tests
 * Refactor
 * More -- See if I'm making sure the Bootstrap classes are present.
* Documentation
* Refactor :boolean to use common "choices" code (if possible.) (Not sure it is.)
* Boostrap
  * Ask why they use 'inline-inputs' class instead of a fieldset tag.
  * Why 'help-inline' and 'help-block' when they could have done p.help and span.help?
## Copyright

Copyright (c) 2011 Matthew Bellantoni. See LICENSE.txt for further details.

