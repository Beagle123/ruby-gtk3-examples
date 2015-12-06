#!/usr/bin/env ruby

require 'gtk3'

window = Gtk::Window.new
window.set_title('Revealer')
window.signal_connect('destroy') {
    Gtk::main_quit
}

grid = Gtk::Grid.new
window.add(grid)

revealer = Gtk::Revealer.new
grid.attach(revealer, 0, 1, 2, 1)

buttonShow = Gtk::Button.new :label => 'Show'
buttonShow.signal_connect('clicked') {
    revealer.set_reveal_child(true)
}
grid.attach(buttonShow, 0, 0, 1, 1)

buttonHide = Gtk::Button.new :label => 'Hide'
buttonHide.signal_connect('clicked') {
    revealer.set_reveal_child(false)
}
grid.attach(buttonHide, 1, 0, 1, 1)

label = Gtk::Label.new('Label in a Revealer')
label.set_size_request(200, 200)
revealer.add(label)

window.show_all

Gtk.main
