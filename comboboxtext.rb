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
comboboxtext.set_active(0)
comboboxtext.signal_connect('changed') {
    puts 'Paper size set to %s' % comboboxtext.active_text
}
window.add(comboboxtext)

window.show_all

Gtk.main
