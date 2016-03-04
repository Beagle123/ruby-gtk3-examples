#!/usr/bin/env ruby

require 'gtk3'

def on_color_set(colorbutton)
    puts('Color selected: %s' % colorbutton.color)
end

window = Gtk::Window.new
window.set_title('ColorButton')
window.set_default_size(200, -1)
window.signal_connect('destroy') {
    Gtk::main_quit
}

colorbutton = Gtk::ColorButton.new
colorbutton.set_title('Select Color')
colorbutton.signal_connect('color-set') {on_color_set(colorbutton)}
window.add(colorbutton)

window.show_all

Gtk.main
