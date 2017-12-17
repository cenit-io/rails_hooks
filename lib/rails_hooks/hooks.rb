require 'rails_hooks/hooks/version'
require 'rails_hooks/observer/event'
module RailsHooks
  module Hooks
    def self.table_name_prefix
      'hooks_'
    end
  end
end

RailsHooks::Observer::Event.when_triggered do |record, event|
  event.hooks.each do |hook|
    hook.notify(record, event.id)
  end
end
