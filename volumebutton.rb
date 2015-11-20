#!/usr/bin/env ruby

require 'gtk3'

window = Gtk::Window.new
window.set_default_size(200, 200)
window.set_title('VolumeButton')
window.signal_connect('destroy') {
    Gtk::main_quit
}

grid = Gtk::Grid.new
window.add(grid)

volumebutton = Gtk::VolumeButton.new
volumebutton.set_value(50)
volumebutton.signal_connect('value-changed') {
    puts "VolumeButton value set to %.2f" % volumebutton.value
}
grid.attach(volumebutton, 0, 0, 1, 1)

window.show_all

Gtk.main
