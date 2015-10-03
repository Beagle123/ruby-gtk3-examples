#!/usr/bin/env ruby

require 'gtk3'

window = Gtk::Window.new
window.set_title('Button')
window.signal_connect("delete-event") {
    Gtk::main_quit
}

button = Gtk::Button.new
button.set_label("Click Me!")
button.signal_connect('clicked') {
    print "Button was clicked!\n"
}
window.add(button)

window.show_all

Gtk.main
