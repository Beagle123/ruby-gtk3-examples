#!/usr/bin/env ruby

require 'gtk3'

window = Gtk::Window.new
window.set_title('LinkButton')
window.signal_connect('destroy') {
    Gtk::main_quit
}

linkbutton = Gtk::LinkButton.new('Go to the Programmica website')
linkbutton.set_uri('http://programmica.com')
window.add(linkbutton)

window.show_all

Gtk.main
