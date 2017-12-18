module RailsHooks
  class NotificationLog < ActiveRecord::Base
    belongs_to :event, class_name: RailsHooks::Observer::Event.name
    belongs_to :notification_hook, class_name: RailsHooks::Hooks::NotificationHook.name
  end
end
