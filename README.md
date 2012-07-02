# Protection

This gem gives drop-in staging environment HTTP basic auth for rails apps, maybe any Ruby web app.

## Installation

**Must be using Neoteric's GemFury source, as this is private**

Add this line to your application's Gemfile:

    gem 'protection'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install protection

## Usage

In the controller you want to protect, or in application_controller to protect the entire app:

    class ApplicationController < ActionController::Base
      include Neoteric::Protection
    end

And you must set these two ENV variables:

    export STAGING_USERNAME=*your_username*
    export STAGING_PASSWORD=*your_secret*
