#!/usr/bin/env ruby

require 'gtk3'

window = Gtk::Window.new
window.set_title('SearchEntry')
window.signal_connect('destroy') {
    Gtk::main_quit
}

searchentry = Gtk::SearchEntry.new
searchentry.set_placeholder_text('Enter some text...')
searchentry.signal_connect('activate') {
    puts 'SearchEntry text: %s' % searchentry.text
    searchentry.set_text('')
}
window.add(searchentry)

window.show_all

Gtk.main
