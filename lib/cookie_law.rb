require 'cookie_law/version'
require 'cookie_law/helper'
require 'cookie_law/engine'
require 'cookie_law/configuration'
require 'cookie_law/missing_policy_link_exception'

module CookieLaw
  COOKIE_NAME = 'cl_accepted'
  DEFAULT_EXPIRATION = 365 # In Days
  BEHAVIOR = :any

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

  def behavior
    configuration.behavior || BEHAVIOR
  end
end

ActiveSupport.on_load(:action_view) do
  include CookieLaw::Helper
end
