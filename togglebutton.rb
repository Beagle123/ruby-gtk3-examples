#!/usr/bin/env ruby

require 'gtk3'

def on_togglebutton_toggled(togglebutton)
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
togglebutton.signal_connect('toggled') { on_togglebutton_toggled(togglebutton) }
window.add(togglebutton)

window.show_all

Gtk.main
