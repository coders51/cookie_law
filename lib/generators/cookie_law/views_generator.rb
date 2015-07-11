require 'rails/generators'

module CookieLaw
  class ViewsGenerator < Rails::Generators::Base
    desc 'Copies CookieLaw views in your project'

    def self.source_root
      @source_root ||= File.join(File.dirname(__FILE__), 'templates')
    end

    def copy_views
      view_path = Rails.root.join('app', 'views', 'cookie_law')
      # unless Dir.exists? view_path
      #   Dir.mkdir view_path
      # end
      copy_file '_banner.html.erb', view_path.join('_banner.html.erb')
    end
  end
end
