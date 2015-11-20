#!/usr/bin/env ruby

require 'gtk3'

window = Gtk::Window.new
window.set_title('Window')
window.signal_connect('destroy') {
  Gtk::main_quit
}
window.show_all

Gtk.main
