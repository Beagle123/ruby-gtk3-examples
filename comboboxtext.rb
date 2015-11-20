#!/usr/bin/env ruby

require 'gtk3'

window = Gtk::Window.new
window.set_title('ComboBoxText')
window.signal_connect('destroy') {
    Gtk::main_quit
}

comboboxtext = Gtk::ComboBoxText.new
comboboxtext.append('0', 'A3')
comboboxtext.append('1', 'A4')
comboboxtext.append('2', 'B5')
comboboxtext.append('3', 'Letter')
comboboxtext.signal_connect('changed') {
    print "Paper size set to " + comboboxtext.active_text
    print "\n"
}
window.add(comboboxtext)

window.show_all

Gtk.main
