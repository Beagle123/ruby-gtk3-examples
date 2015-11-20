#!/usr/bin/env ruby

require 'gtk3'

window = Gtk::Window.new
window.set_default_size(200, 200)
window.set_title('Spinner')
window.signal_connect('destroy') {
    Gtk::main_quit
}

grid = Gtk::Grid.new
grid.set_row_spacing(5)
grid.set_column_homogeneous(true)
window.add(grid)

spinner = Gtk::Spinner.new
spinner.set_vexpand(true)
spinner.set_hexpand(true)
grid.attach(spinner, 0, 0, 2, 1)

buttonStart = Gtk::Button.new :label =>'Start'
buttonStart.signal_connect('clicked') {
    spinner.start()
}
grid.attach(buttonStart, 0, 1, 1, 1)
buttonEnd = Gtk::Button.new :label =>'Stop'
buttonEnd.signal_connect('clicked') {
    spinner.stop()
}
grid.attach(buttonEnd, 1, 1, 1, 1)

window.show_all

Gtk.main
