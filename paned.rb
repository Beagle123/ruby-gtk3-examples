#!/usr/bin/env ruby

require 'gtk3'

window = Gtk::Window.new
window.set_default_size(200, 200)
window.set_title('Paned')
window.signal_connect('destroy') {
    Gtk::main_quit
}

hpaned = Gtk::Paned.new :horizontal
window.add(hpaned)

label = Gtk::Label.new('Paned Add 1')
hpaned.add1(label)

vpaned = Gtk::Paned.new :vertical
vpaned.set_position(100)
hpaned.add2(vpaned)

label = Gtk::Label.new('Paned Add 2')
vpaned.add1(label)

label = Gtk::Label.new('Paned Add 3')
vpaned.add2(label)

window.show_all

Gtk.main
