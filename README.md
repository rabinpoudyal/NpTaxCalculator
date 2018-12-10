# NpTaxCalculator

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'np_tax_calculator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install np_tax_calculator

## Usage

The tax calculator takes two parameters :annual_taxable_income and tax_status.
There can be more tax status than the following case.

NpTaxCalculator::TaxCalculator.new.calculate_tax(1400000, "Single")
NpTaxCalculator::TaxCalculator.new.calculate_tax(100000, "Married")

The output is the 2D array that contains tax rate applied, tax amount and tax slab.
[ [tax_rate_applied, tax_amount, tax_slab]... ]

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rabinpoudyal/np_tax_calculator.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
