#!/usr/bin/env ruby

require 'gtk3'

window = Gtk::Window.new
window.set_default_size(200, 200)
window.set_title('Frame')
window.set_border_width(5)
window.signal_connect('destroy') {
    Gtk::main_quit
}

frame = Gtk::Frame.new("Frame")
window.add(frame)

label = Gtk::Label.new("Label in a Frame")
frame.add(label)

window.show_all

Gtk.main
