# Glib-Eventable

This is a helper gem for [ruby-gnome2][gtk] applications.

Instead of writing:

```ruby
class Window < Gtk::Window
  def initialize
    signal_connect('destroy') { Gtk.main_quit }
  end
end
```

This allows you to write:

```ruby
class Window < Gtk::Window
  event destroy: :on_destroy
  
  def on_destroy
    Gtk.main_quit
  end
end
```

Or simply:

```ruby
class Window < Gtk::Window
  event destroy: -> { Gtk.main_quit }
end
```

This allows you to create subclasses of `Gtk` objects in a more OOP style.

## Install

### Bundler: `gem 'glib-eventable'`

### RubyGems: `gem install glib-eventable`

## Usage

```ruby
require 'glib/eventable'

class MyToggleRenderer < Gtk::CellRendererToggle
  event toggled: :on_toggle
  
  def initialize(column)
    @column = column
    
    super()
  end
  
  def on_toggle(path)
    iter = @column.tree_view.model.get_iter(path)
          
    iter[1] = case iter[1]
    when 'Running' then 'Stopped'
    when 'Stopped' then 'Running'
    end
  end
end
```
## Contributing

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start or switch to a testing/unstable/feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, VERSION or gemspec.

## Copyright

Copyright © 2012 Ryan Scott Lewis <ryan@rynet.us>.

The MIT License (MIT) - See LICENSE for further details.

[gtk]: http://ruby-gnome2.sourceforge.jp/