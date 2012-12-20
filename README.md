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

**You must have a staging environment**

    $ cp config/environments/production.rb config/environments/staging.rb

**Add a `staging` section to your database.yml**

**Run your app in staging mode**

    $ RAILS_ENV=staging
    $ heroku config:add RAILS_ENV=staging

In the controller you want to protect, or in application_controller to protect the entire app:

    class ApplicationController < ActionController::Base
      rehearse_with :username => 'username',
                    :password => 'password'
    end

Add the CSS to your application.css:

    @import "rehearsal";

    -or-

    //= require rehearsal

**or** define your own style:

    #rehearsal-staging-banner {
      /* styles */
    }

## Staging Banner View Helper

In your view templates (for example, in your layout), you can insert the banner:

    <body>
      <%= staging_banner :message => "Put your message here" %>
      <!-- ... -->
    </body>
