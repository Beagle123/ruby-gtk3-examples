#!/usr/bin/env ruby

require 'gtk3'

window = Gtk::Window.new
window.set_default_size(-1, 200)
window.set_title('HeaderBar')
window.signal_connect('destroy') {
    Gtk::main_quit
}

headerbar = Gtk::HeaderBar.new
headerbar.set_title('HeaderBar Example')
headerbar.set_subtitle('HeaderBar Subtitle')
headerbar.set_show_close_button(true)
window.set_titlebar(headerbar)

button = Gtk::Button.new :label => 'Open'
headerbar.pack_start(button)

window.show_all

Gtk.main
