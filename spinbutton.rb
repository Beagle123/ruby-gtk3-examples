#!/usr/bin/env ruby

require 'gtk3'

window = Gtk::Window.new
window.set_title('SpinButton')
window.signal_connect("delete-event") {
    Gtk::main_quit
}

spinbutton = Gtk::SpinButton.new(0, 100, 1)
spinbutton.set_value(50)
spinbutton.signal_connect('value-changed') {
    print spinbutton.value, "\n"
}
window.add(spinbutton)

window.show_all

Gtk.main
