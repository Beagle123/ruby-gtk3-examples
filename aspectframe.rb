#!/usr/bin/env ruby

require 'gtk3'

window = Gtk::Window.new
window.set_default_size(200, 200)
window.set_title('AspectFrame')
window.set_border_width(5)
window.signal_connect("destroy") {
    Gtk::main_quit
}

label = Gtk::Label.new("Label in an AspectFrame")

aspectframe = Gtk::AspectFrame.new("AspectFrame", 0.5, 0.5, 1.0, false)
aspectframe.add(label)
window.add(aspectframe)

window.show_all

Gtk.main
