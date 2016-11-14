# CoolpayApp

CoolpayApp is a simple app for interacting with the Coolpay API.
 
The app can be used to:
 
- Authenticate a user to the Coolpay API
- Add one or more recipients for a payment
- Send money money to the list of recipients
- Check whether a payment was successful

The Coolpay API documentation can be found here:

http://docs.coolpayapi.apiary.io/


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'coolpay_app'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install coolpay_app

## Usage

    Create a new authenticated session:

        session = Session.new()

    Create a new recipient if it does not exist:

        recipient_id = Recipient.add_recipient(recipient_name)

    Pay a recipient:

        payment_id = Payment.make_payment(payment_amount, payment_currency,
                                          recipient_id)

    Check a payment status:

        status = Payment.check_payment(payment_id)


## Script

    Usage: coolpay --recipient NAME [options]
        -r, --recipient=NAME             Recipient name.
        -a, --add                        Add new recipient.
        -p, --pay                        Pay recipient.
        -n, --amount=AMOUNT              Amount to send to the recipient.
        -c, --currency=CURRENCY          Currency to use for the payment.
        -i, --payment-id=ID              Check whether a payment was successful.
        -h, --help                       Prints this help.


    Create a new recipient if it does not exist:

        ./bin/coolpay -r "Mario" -a

    Pay a recipient:

        ./bin/coolpay -r "Mario" -p -n 100 -c "GBP"

    Check a payment status:

        ./bin/coolpay -i "4c9c3365-a08c-4c8a-afe1-d9d2d3d3fde7"

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/coolpay` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/luigi-riefolo/coolpay_app.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
