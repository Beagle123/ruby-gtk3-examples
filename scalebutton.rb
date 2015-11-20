#!/usr/bin/env ruby

require 'gtk3'

window = Gtk::Window.new
window.set_default_size(200, 200)
window.set_title('ScaleButton')
window.signal_connect('destroy') {
    Gtk::main_quit
}

grid = Gtk::Grid.new
window.add(grid)

scalebutton = Gtk::ScaleButton.new(Gtk::IconSize::IconSize::BUTTON)
scalebutton.set_icons(['gtk-goto-bottom', 'gtk-goto-top'])
scalebutton.set_value(50)
scalebutton.signal_connect('value-changed') {
    puts "ScaleButton value set to %.2f" % scalebutton.value
}
grid.attach(scalebutton, 0, 0, 1, 1)

window.show_all

Gtk.main
