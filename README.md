# Rehearsal

This gem enables drop-in HTTP basic auth for Rails apps with a banner view helper

You also get a `rehearsal_banner` view helper

## Installation

Run `bundle install` after adding this to your Gemfile:

```ruby
gem 'rehearsal', '~> 1.2.0'
```

## Usage

**By default, Rehearsal depends on a Rails staging environment**

In the controller you want to protect

```ruby
class ApplicationController < ActionController::Base
  rehearse_with 'username', 'password'
end
```

## Rehearsal Banner View Helper

The rehearsal banner will appear in the configured Rehearsal.config.env, :staging by default

In your view templates (for example, in your layout), you can insert the banner:

```erb
<body>
  <!-- You can use multi-line HTML/erb with a block... -->
  
  <%= rehearsal_banner do %>
    Put a message here with <%= link_to 'a link', '/to/somewhere' %>
  <% end %>



  <!-- ...or, pass in a string for simple messages -->
  
  <%= rehearsal_banner "Put your message here" %>
</body>
```

You can style the banner:

```css
#rehearsal-banner {
  /* styles */
}
```

Or require the default CSS:

```scss
//= require rehearsal

// or, scss:
@import "rehearsal";
```

## Configurable options

```
$ rails g rehearsal:intializer
```

```ruby
# config/intitializers/rehersal.rb

Rehearsal.configure do |config|
  config.env     = :staging
  config.enabled = true
end
```
