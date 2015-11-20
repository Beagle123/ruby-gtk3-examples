#!/usr/bin/env ruby

require 'gtk3'

window = Gtk::Window.new
window.set_title('ButtonBox')
window.signal_connect('destroy') {
    Gtk::main_quit
}

buttonbox = Gtk::ButtonBox.new :horizontal
window.add(buttonbox)

button = Gtk::Button.new :label => "Single-line button"
buttonbox.add(button)
button = Gtk::Button.new :label => "Multi-line\nbutton"
buttonbox.add(button)
button = Gtk::Button.new :label => "Extra long multi-line\nbutton"
buttonbox.add(button)

window.show_all

Gtk.main
