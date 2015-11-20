#!/usr/bin/env ruby

require 'gtk3'

window = Gtk::Window.new
window.set_title('EntryBuffer')
window.signal_connect('destroy') {
    Gtk::main_quit
}

grid = Gtk::Grid.new
grid.set_row_spacing(5)
window.add(grid);

entrybuffer = Gtk::EntryBuffer.new
entrybuffer.set_text('Text in EntryBuffer')

entry = Gtk::Entry.new
entry.set_buffer(entrybuffer)
grid.attach(entry, 0, 0, 1, 1)

entry = Gtk::Entry.new
entry.set_buffer(entrybuffer)
grid.attach(entry, 0, 1, 1, 1)

entry = Gtk::Entry.new
entry.set_buffer(entrybuffer)
grid.attach(entry, 0, 2, 1, 1)

window.show_all

Gtk.main
