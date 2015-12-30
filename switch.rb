#!/usr/bin/env ruby

require 'gtk3'

def on_switch_toggled(switch)
    active = switch.active? ? true : false

    if active == true
        puts 'Switch is on'
    else
        puts 'Switch is off'
    end
end

window = Gtk::Window.new
window.set_title('Switch')
window.signal_connect('destroy') {
    Gtk::main_quit
}

switch = Gtk::Switch.new
switch.signal_connect('notify::active') {on_switch_toggled(switch)}
window.add(switch)

window.show_all

Gtk.main
