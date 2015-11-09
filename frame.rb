#!/usr/bin/env ruby

require 'gtk3'

window = Gtk::Window.new
window.set_default_size(200, 200)
window.set_title('Frame')
window.set_border_width(5)
window.signal_connect("destroy") {
    Gtk::main_quit
}

label = Gtk::Label.new("Label in a Frame")

frame = Gtk::Frame.new("Frame")
frame.add(label)
window.add(frame)

window.show_all

Gtk.main
