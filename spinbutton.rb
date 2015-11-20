#!/usr/bin/env ruby

require 'gtk3'

window = Gtk::Window.new
window.set_title('SpinButton')
window.signal_connect('destroy') {
    Gtk::main_quit
}

spinbutton = Gtk::SpinButton.new(0, 100, 1)
spinbutton.set_value(50)
spinbutton.signal_connect('value-changed') {
    puts "SpinButton value set to %.2f" % spinbutton.value
}
window.add(spinbutton)

window.show_all

Gtk.main
