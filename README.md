# Solidfire
This is the solidfire gem. Feel free to use it to your heart's content, but be aware that this gem is in the develop phase. Any version you use will be a beta version until the gem is officially released. As such, it may have latent bugs. Feel free to contact Ariel Hoffman for help and bugfixes at ariel.hoffman@netapp.com.

## Installation
You'll have to install the gemfile from source.

1. Clone this project onto your machine.
2. Set up your RVM or version of Ruby. RVM stands for ruby version manager. It is very helpful for troubleshooting. For more info about RVMs, see https://rvm.io/. 
3. Execute the following commands:

```ruby
gem build solidfire.gemspec
gem install solidfire-0.1.0.gem
```
Now the gem should be installed on your version of Ruby!

## Usage
To get a basic script up and running, I recommend first establishing a connection with the ElementFactory class as follows:

```ruby
# Import the module
require 'solidfire'
# Set up a connection. There are two ways to do this - directly or indirectly.
# This is the indirect method and it contains a whole bunch of checks and logging
# features, so I recommend you use it. The direct method has basically the same
# interface though. You just call it on Element.new instead of ElementFactory.create
@user = 'admin'
@pass = 'admin'
@host = '10.117.61.44'
e = ElementFactory.create(host, user, pass)
# Now you can run your first command!
# The ruby sdk supports all the same functionality as the Fluorine API does.
e.list_accounts() # This will list the accounts
e.get_account_by_id(3065) # This will get a specific account

```

To see the full list of commands supported, navigate into lib/solidfire/element.rb. All the available commands are in that file.
