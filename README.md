# Rehearsal

Do you host sites on a staging server during development for client & team review?

Can't remember that http basic auth code you're supposed to use?

Do you forget to guard it behind a Rails.env conditional, or remove the code before production?

This gem provides an easy-to-remember method for using HTTP Basic Auth in a designated Rails environment.

It also comes with a simple view helper for displaying a banner to your visitors in that environment.

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
$ rails g rehearsal:initializer
```

```ruby
# config/initializers/rehersal.rb

Rehearsal.configure do |config|
  config.env     = :staging
  config.enabled = true
end
```
