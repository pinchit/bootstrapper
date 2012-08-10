# Bootstrapper

Bootstrap it up! Send your data to backbone.

Mostly ripped off from Gon (https://github.com/gazay/gon)

## Installation

Add this line to your application's Gemfile:

    gem 'bootstrapper'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bootstrapper

## Usage

In your controller:

bootstrap.current_user = current_user
bootstrap.weather = "Nice"
bootstrap.fruit_emotions = { apple: "Petulent", pear: "Lackadaisical" }

In your view:
<%= bootstrap_data %>

In your JS:
window.bootstrap.fruitEmotions.apple

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
