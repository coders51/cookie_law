require 'cookie_law/version'
require 'cookie_law/helper'
require 'cookie_law/engine'
require 'cookie_law/configuration'
require 'cookie_law/missing_policy_link_exception'

module CookieLaw
  COOKIE_NAME = 'cl_accepted'
  DEFAULT_EXPIRATION = 365 # In Days
  ACCEPT_ON_SCROLL = true
  ACCEPT_ON_ANY_LINK = true
  DEFAULT_SCROLL_HEIGHT = 180

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.cookie_name
    configuration.cookie_name || COOKIE_NAME
  end

  def self.policy_link
    if configuration.policy_link.nil?
      raise MissingPolicyLinkException
    end
    configuration.policy_link
  end

  def self.scroll_height
    configuration.scroll_height || DEFAULT_SCROLL_HEIGHT
  end

  def self.expiration
    configuration.expiration || DEFAULT_EXPIRATION
  end

  def self.accept_on_any_link
    configuration.accept_on_any_link || ACCEPT_ON_ANY_LINK
  end

  def self.accept_on_scroll
    configuration.accept_on_scroll || ACCEPT_ON_SCROLL
  end
end

ActiveSupport.on_load(:action_view) do
  include CookieLaw::Helper
end
