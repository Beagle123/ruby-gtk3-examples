#!/usr/bin/env ruby

require 'gtk3'

window = Gtk::Window.new
window.set_title('Entry')
window.signal_connect('destroy') {
    Gtk::main_quit
}

entry = Gtk::Entry.new
entry.set_placeholder_text('Enter some text...')
entry.signal_connect('activate') {
    puts 'Entry text: %s' % entry.text
    entry.set_text('')
}
window.add(entry)

window.show_all

Gtk.main
