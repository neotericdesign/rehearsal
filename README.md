# Rehearsal

Do you host sites on a staging server during development for client & team review?

Can't remember that http basic auth code you're supposed to use?

Do you forget to guard it behind a Rails.env conditional, or remove the code before production?

This gem provides an easy-to-remember method for using HTTP Basic Auth in a designated Rails environment.

It also comes with a simple view helper for displaying a banner to your visitors in that environment.

## Installation

```ruby
# Gemfile

gem 'rehearsal', '~> 2.0.0'
```

```
$ bundle install

$ rails g rehearsal:install
-or-
$ rails g rehearsal:install user

(please see Configuring Rehearsal below)
```

## Usage

**By default, Rehearsal is enabled only in a Rails `staging` environment**

```
$ cp config/environments/production.rb config/environments/staging.rb
```

The HTTP Basic Auth will prompt in environments configured in `auth_envs`

```ruby
class ApplicationController < ActionController::Base
  rehearse_with 'username', 'password'
end
```

## Rehearsal Banner View Helper

The rehearsal banner will appear in environments configured in `banner_envs`

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

## Configuring Rehearsal

You can configure Rehearsal globally:

```
$ rails g rehearsal:install
```

It will install an initializer for your Rails app:

```ruby
# config/initializers/rehersal.rb

Rehearsal.configure do |config|
  config.auth_envs   = [:staging]
     # Configure environments for HTTP Basic Auth login

  config.banner_envs = [:staging, :development]
     # Configure environments for view template banner

  config.enabled     = true
     # true  : obeys environment configs above
     # false : turn Rehearsal off, regardless of configs
end
```

And now you can configure Rehearsal per user:

```
$ rails g rehearsal:install user
```

It will install a hidden yaml config in your Rails root:

```yml
# .rehearsal
# this file is added to .gitignore

auth_envs:   staging
banner_envs: staging, development
enabled:     true
```

The config/initializer file is removed during a user install

The .rehearsal file is removed during a global(default) install

## TODO:

* Installation should include requiring the CSS
* Installation should include adding the `rehearse_with` method to `ApplicationController`
* Installation should include adding the `rehearsal_banner` as a partial to the view templates
