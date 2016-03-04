#!/usr/bin/env ruby

require 'gtk3'

def on_font_set(fontbutton)
    puts('Font selected: %s' % fontbutton.font_name)
end

window = Gtk::Window.new
window.set_title('FontButton')
window.set_default_size(200, -1)
window.signal_connect('destroy') {
    Gtk::main_quit
}

fontbutton = Gtk::FontButton.new
fontbutton.set_title('Select Font')
fontbutton.signal_connect('font-set') {on_font_set(fontbutton)}
window.add(fontbutton)

window.show_all

Gtk.main
