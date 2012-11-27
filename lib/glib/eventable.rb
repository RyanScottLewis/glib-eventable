require 'bundler/setup'
require 'version'

# Add Eventable to GLib
module GLib
  
  # This allows you to create subclasses of `Gtk` objects in a more OOP style.
  module Eventable
    is_versioned
    
    # Connect a signal to a method or return all connected events.
    # 
    # @return [Hash] a Hash where the key is the signal and the value is the method name.
    def event(event_hash=nil)
      @events ||= {}
      return @events if event_hash.nil?
      
      raise TypeError, 'event_hash must respond to :to_hash or :to_h' unless [:to_hash, :to_h].any? { |method_name| event_hash.respond_to?(method_name) }
      event_hash = event_hash.to_hash rescue event_hash.to_h
        
      @events = event_hash.merge(@events)
    end
    alias_method :events, :event
    
    # Connect signals to events before initialization.
    def new(*args)
      super.instance_eval do
        self.class.events.each do |event_name, method_name|
          # TODO: These should be /defined/ as this, not read as this
          event_name = event_name.to_s.downcase.strip
          method_name = method_name.to_s.downcase.strip.to_sym
          
          signal_connect(event_name) { |object, *args| send(method_name, *args)}
        end
        
        self
      end
    end
  end
  
  # Modify all Instantiatable with Eventable
  class Instantiatable
    extend Eventable
  end
  
end
