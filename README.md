# CookieLaw

CookieLaw aims to help Ruby on Rails developer to deal with European Cookie Policy.

From June 2015 it is required for every website targeting European users to display a banner and obtain user consent before installing non technical cookies in user's browser.

To keep it simple, if you use Google Analytics or every other tracking/profiling service which relies on cookies, you must have this banner.

## Getting Started

Add this line to your application's Gemfile:

```ruby
gem 'cookie_law'
```

Run the bundle command to install it.

After you have installed the gem, you need to run the generator:

```sh
rails generate cookie_law:install
```

The generator will create the initializer file in your rails project,
with all configuration options explained. You should take a look at it
and you **MUST** provide your *policy link* or `cookie_law` will raise
`MissingPolicyLinkException` when you start your server.

You will need to add two requires in you `application.js` and `application.css` files:

```javascript
// app/assets/javascripts/application.js
// ...
//= require js.cookie
//= require cookie_law
```

and

```css
/* app/assets/javacsripts/application.css
 * ...
 *= require cookie_law
 */
```

After having configured your initializer and js/css files you can insert the `cookie_law!`
helper call in your layout (inside the html body)

```html
  <%= cookie_law! %>
```

This will render the default `_banner.<locale>.html.erb` present in this gem.

When accepting policy with click, `cookie_law` will intercepts every click in the page. If you need to
add some exception to this behavior (for example when linking you Privacy Policy) you can add the 
`.no_cl_accept` class to such links.

## Javascript events

`cookie_law` comes with a Javascript library. You should not run any cookie-based profiling tool
if the policy is not accepted. To deal with this, `cookie_law` will trigger events in your `document`
to allow you to run code in different conditions. Let's see it with an example:

```javascript
$(document).on('cl:ready', function() {
  // This function will be called only when the users accepts the cookie policy
  // with one of the allowed method.
  // Will also be called after every document.ready function if the policy has been accepted.
  // This is the right place to trigger Google Analytics track page, for example
});

$(document).on('cl:page_change', function() {
  // If your application uses Turbolinks, this event will be triggered after every
  // 'page:change' Turbolinks event
});
```

## Configuring views

You can customize the appearance of the banner copying and change the views.
Simply run

```sh
rails generate cookie_law:views
```

and you will have the default view copied in your project. You can find the view in `app/views/cookie_laws/_banner.html.erb`.

## Thanks

This project uses the awesome [js-cookie](https://github.com/js-cookie/js-cookie).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/cookie_law/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
