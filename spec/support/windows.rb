class BaseWindow < Gtk::Window
  event destroy: :on_destroy
  
  def initialize
    super
    @is_destroyed = false
  end
  
  def on_destroy(*args)
    @is_destroyed = true
  end
end

class MainWindow < BaseWindow; end

class ProcWindow < BaseWindow
  event destroy: -> { |*args| @is_destroyed = :true_from_proc }
end
