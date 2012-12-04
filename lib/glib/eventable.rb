require 'bundler/setup'
require 'version'

# Add Eventable to GLib
module GLib
  
  # This allows you to create subclasses of `Gtk` objects in a more OOP style.
  module Eventable
    is_versioned
    
    # Connect a signal to a method or return all connected events.
      # 
      # @param [{ Symbol => Symbol }] event_hash a Hash where the key is the signal and the value is the method name.
      # @return [Hash] a Hash of all registered events where the key is the signal and the value is the method name.
    def event(event_hash=nil)
      @events ||= ancestors[1].respond_to?(:events) ? ancestors[1].events.dup : {}
      return @events if event_hash.nil?
      
      raise TypeError, 'event_hash must respond to :to_hash or :to_h' unless event_hash.respond_to?(:to_hash) || event_hash.respond_to?(:to_h)
      event_hash = event_hash.to_hash rescue event_hash.to_h
      
      @events = @events.merge(event_hash).each_with_object({}) do |(event_name, method_name_or_proc), memo|
        raise TypeError, 'event_hash keys must respond to :to_s' unless event_hash.respond_to?(:to_s)
        raise TypeError, 'event_hash values must respond to :call or :to_s' unless method_name_or_proc.respond_to?(:call) || method_name_or_proc.respond_to?(:to_s)
        
        event_name = event_name.to_s.downcase.strip
        method_name_or_proc = method_name_or_proc.to_s.downcase.strip.to_sym unless method_name_or_proc.respond_to?(:call)
        
        memo[event_name] = method_name_or_proc
      end
    end
    alias_method :events, :event
    
    # Connect signals to events before initialization.
    def new(*args)
      super.instance_eval do
        self.class.events.each do |event_name, method_name_or_proc|
          signal_connect(event_name) do |*arguments|
            proc = method_name_or_proc.respond_to?(:call) ? method_name_or_proc : method(method_name_or_proc).to_proc
            arguments = arguments[0...proc.arity] if proc.arity >= 0
            
            instance_exec(*arguments, &proc)
          end
        end
        
        self
      end
    end
  end
  
  # Modify all Instantiatable objects with Eventable
  class Instantiatable
    extend Eventable
  end
  
end
