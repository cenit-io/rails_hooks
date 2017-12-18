module RailsHooks
  class Engine < Rails::Engine
    isolate_namespace RailsHooks
    engine_name 'rails_hooks'

    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths << File.expand_path("../../", __FILE__)
    config.autoload_paths << File.expand_path("../../../app", __FILE__)

    class << self
      def activate
        cache_klasses = %W(#{config.root}/app/**/*.rb)
        Dir.glob(cache_klasses) do |klass|
          Rails.configuration.cache_classes ? require(klass) : load(klass)
        end
      end
    end

    config.to_prepare(&method(:activate).to_proc)
  end
end
