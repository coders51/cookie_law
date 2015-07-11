require 'rails/generators'

module CookieLaw
  class InstallGenerator < Rails::Generators::Base
    desc 'Creates CookieLaw initializer with default configuration'

    def self.source_root
      @source_root ||= File.join(File.dirname(__FILE__), 'templates')
    end

    def copy_initializer
      template 'cookie_law.rb', 'config/initializers/cookie_law.rb'
    end
  end
end
