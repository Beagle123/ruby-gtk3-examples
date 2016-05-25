#!/usr/bin/env ruby

require 'gtk3'

window = Gtk::Window.new
window.set_title('Fixed')
window.set_default_size(200, 200)
window.signal_connect('destroy') {
    Gtk::main_quit
}

fixed = Gtk::Fixed.new
window.add(fixed)

button = Gtk::Button.new :label => 'Button 1'
fixed.put(button, 30, 75)
button = Gtk::Button.new :label => 'Button 2'
fixed.put(button, 125, 100)

window.show_all

Gtk.main
