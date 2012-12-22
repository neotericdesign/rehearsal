# Rehearsal

This gem enables drop-in HTTP basic auth for Rails apps with a banner view helper

You also get a `rehearsal_banner` view helper

## Installation

Run `bundle install` after adding this to your Gemfile:

    gem 'rehearsal'

## Usage

**By default, Rehearsal depends on a Rails staging environment**

In the controller you want to protect

```ruby
class ApplicationController < ActionController::Base
  rehearse_with :username => 'username',
                :password => 'password'
end
```

Require the CSS in your asset pipeline:

```scss
//= require rehearsal

// or, scss:
@import "rehearsal";
```

**or** define your own style:

```css
#rehearsal-banner {
  /* styles */
}
```

## Rehearsal Banner View Helper

In your view templates (for example, in your layout), you can insert the banner:

```html.erb
<body>
  <%= rehearsal_banner :message => "Put your message here" %>
  <!-- ... -->
</body>
```

## Configurable options

At this time, you can configure the Rails environment to enable Rehearsal on:

```
$ rails g rehearsal:intializer
```

```ruby
# config/intitializers/rehersal.rb

Rehearsal.configure do |config|
  config.env = :development
end
```
