# You can customize CookieLaw configuration with this initializer
CookieLaw.configure do |config|
  # This is the cookie name as it will be stored in the user browser
  # You should add this to your cookie policy
  #
  # config.cookie_name = 'cl_accepted'

  # This defines for how long the cookie will last in user browser
  # in days. Default value is 365 days
  #
  # config.expiration = 365

  # You need to add the link to your privacy policy. There is no
  # default value and you MUST add your url. This will raise
  # a MissingPolicyLinkException if not present
  #
  # config.policy_link = 'https://www.example.com/cookie_policy.html'

  # You can configure the behavior of policy acceptance.
  # Accepted methods, besides clicking on Close link on banner,
  # are via click on links or scroll.
  # config.accept_on_any_link = true
  # config.accept_on_scroll = true
  #
  # You can also define the minimum scroll span the user has to scroll
  # for accept via scrolling. Default value is 180
  #
  # config.scroll_height = 180
end

