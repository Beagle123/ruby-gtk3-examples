#!/usr/bin/env ruby

require 'gtk3'

window = Gtk::Window.new
window.set_title('Grid')
window.signal_connect("destroy") {
  Gtk::main_quit
}

grid = Gtk::Grid.new
grid.set_border_width(5)
grid.set_row_spacing(5)
grid.set_column_spacing(5)
window.add(grid)

label = Gtk::Label.new("Position 0, 0")
grid.attach(label, 0, 0, 1, 2)
label = Gtk::Label.new("Position 1, 0")
grid.attach(label, 1, 0, 1, 1)
label = Gtk::Label.new("Position 2, 0")
grid.attach(label, 2, 0, 1, 1)
label = Gtk::Label.new("Position 1, 1")
grid.attach(label, 1, 1, 2, 1)

window.show_all

Gtk.main
