class BaseWindow < Gtk::Window
  event 'destroy' => :on_destroy
  
  def initialize
    super
    @is_destroyed = false
  end
  
  def on_destroy
    @is_destroyed = true
  end
end

class MainWindow < BaseWindow; end
