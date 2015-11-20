#!/usr/bin/env ruby

require 'gtk3'

def on_toggle(togglebutton)
    active = togglebutton.active? ? true : false

    if active == true
        print "ToggleButton is on\n"
    else
        print "ToggleButton is off\n"
    end
end

window = Gtk::Window.new
window.set_title('ToggleButton')
window.signal_connect('destroy') {
    Gtk::main_quit
}

togglebutton = Gtk::ToggleButton.new('ToggleButton')
togglebutton.signal_connect('toggled') { |w| on_toggle(togglebutton) }
window.add(togglebutton)

window.show_all

Gtk.main
