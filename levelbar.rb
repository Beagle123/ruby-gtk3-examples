#!/usr/bin/env ruby

require 'gtk3'

def on_entry_changed entry, levelbar
    levelbar.value = entry.text_length
end

window = Gtk::Window.new
window.set_title('LevelBar')
window.signal_connect('destroy') {
    Gtk::main_quit
}

grid = Gtk::Grid.new
window.add(grid)

levelbar = Gtk::LevelBar.new
levelbar.set_max_value(50)
grid.attach(levelbar, 0, 1, 1, 1)

entry = Gtk::Entry.new
entry.signal_connect('changed') {on_entry_changed(entry, levelbar)}
grid.attach(entry, 0, 0, 1, 1)

window.show_all

Gtk.main
