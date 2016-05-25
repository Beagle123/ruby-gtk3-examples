#!/usr/bin/env ruby

require 'gtk3'

window = Gtk::Window.new
window.set_title('Layout')
window.set_default_size(200, 200)
window.signal_connect('destroy') {
    Gtk::main_quit
}

layout = Gtk::Layout.new
window.add(layout)

button = Gtk::Button.new :label => 'Button 1'
layout.put(button, 80, 15)
button = Gtk::Button.new :label => 'Button 2'
layout.put(button, 125, 140)

window.show_all

Gtk.main
