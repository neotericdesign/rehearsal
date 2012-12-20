# Rehearsal

This gem gives drop-in staging environment HTTP basic auth for rails apps, maybe any Ruby web app.

You also get a `staging_banner` view helper

## Installation

Add this line to your application's Gemfile:

    gem 'rehearsal'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rehearsal

## Usage

In the controller you want to protect, or in application_controller to protect the entire app:

    class ApplicationController < ActionController::Base
      rehearse_with :username => 'username',
                    :password => 'password'
    end

## Staging Banner View Helper

In your view templates (for example, in your layout), you can insert the banner:

    <body>
      <%= staging_banner :message => "Put your message here" %>
      <!-- ... -->
    </body>
