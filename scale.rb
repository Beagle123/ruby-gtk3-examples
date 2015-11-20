#!/usr/bin/env ruby

require 'gtk3'

window = Gtk::Window.new
window.set_title('Scale')
window.set_default_size(200, -1)
window.signal_connect('destroy') {
    Gtk::main_quit
}

scale = Gtk::Scale.new :horizontal
scale.set_range(0, 10)
scale.set_value(5)
scale.signal_connect('value-changed') {
    puts "Scale value set to %.2f" % scale.value
}
window.add(scale)

window.show_all

Gtk.main
