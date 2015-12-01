#!/usr/bin/env ruby

require 'gtk3'

window = Gtk::Window.new
window.set_title('SizeGroup')
window.signal_connect('destroy') {
    Gtk::main_quit
}

grid = Gtk::Grid.new
grid.set_column_spacing(5)
window.add(grid)

sizegroup = Gtk::SizeGroup.new(Gtk::SizeGroup::Mode::BOTH)

label = Gtk::Label.new('To Kill A Mockingbird')
sizegroup.add_widget(label)
grid.attach(label, 0, 0, 1, 1)

label = Gtk::Label.new('Treasure Island')
sizegroup.add_widget(label)
grid.attach(label, 1, 0, 1, 1)

label = Gtk::Label.new('1984')
sizegroup.add_widget(label)
grid.attach(label, 2, 0, 1, 1)

window.show_all

Gtk.main
