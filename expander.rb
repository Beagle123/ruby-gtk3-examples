#!/usr/bin/env ruby

require 'gtk3'

window = Gtk::Window.new
window.set_title('Expander')
window.signal_connect('destroy') {
    Gtk::main_quit
}

expander = Gtk::Expander.new('Expander')
expander.set_resize_toplevel(true)
window.add(expander)

label = Gtk::Label.new('Label in an Expander')
label.set_size_request(200, 200)
expander.add(label)

window.show_all

Gtk.main
