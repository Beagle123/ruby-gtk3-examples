#!/usr/bin/env ruby

require 'gtk3'

window = Gtk::Window.new
window.set_title('Box')
window.set_default_size(200, 200)
window.signal_connect('destroy') {
  Gtk::main_quit
}

hbox = Gtk::Box.new(Gtk::Orientation::HORIZONTAL, 5)
window.add(hbox)

label1 = Gtk::Label.new('Label 1')
hbox.pack_start(label1, :expand => true, :fill => true, :padding => 0)
label2 = Gtk::Label.new('Label 2')
hbox.pack_start(label2, :expand => true, :fill => true, :padding => 0)

vbox = Gtk::Box.new(Gtk::Orientation::VERTICAL, 5)
hbox.pack_start(vbox, :expand => true, :fill => true, :padding => 0)

label3 = Gtk::Label.new('Label 3')
vbox.pack_start(label3, :expand => true, :fill => true, :padding => 0)
label4 = Gtk::Label.new('Label 4')
vbox.pack_start(label4, :expand => true, :fill => true, :padding => 0)

window.show_all

Gtk.main
