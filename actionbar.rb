#!/usr/bin/env ruby

require 'gtk3'

window = Gtk::Window.new
window.set_default_size(400, 200)
window.set_title('ActionBar')
window.signal_connect('destroy') {
    Gtk::main_quit
}

grid = Gtk::Grid.new
window.add(grid)

label = Gtk::Label.new
label.set_vexpand(true)
grid.attach(label, 0, 0, 1, 1)

actionbar = Gtk::ActionBar.new
actionbar.set_hexpand(true)
grid.attach(actionbar, 0, 1, 1, 1)

button = Gtk::Button.new :label => 'Cut'
actionbar.pack_start(button)
button = Gtk::Button.new :label => 'Copy'
actionbar.pack_start(button)
button = Gtk::Button.new :label => 'Paste'
actionbar.pack_end(button)

window.show_all

Gtk.main
