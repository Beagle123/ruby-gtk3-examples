#!/usr/bin/env ruby

require 'gtk3'

def on_checkbutton_toggled checkbutton
    active = checkbutton.active? ? true : false

    if active
        puts "%s has been spotted" % checkbutton.label
    end
end

window = Gtk::Window.new
window.set_title('CheckButton')
window.signal_connect('destroy') {
    Gtk::main_quit
}

grid = Gtk::Grid.new
window.add(grid)

checkbutton1 = Gtk::CheckButton.new('Goshawk')
checkbutton1.signal_connect('toggled') {on_checkbutton_toggled(checkbutton1)}
grid.attach(checkbutton1, 0, 0, 1, 1)
checkbutton2 = Gtk::CheckButton.new('Golden Eagle')
checkbutton2.signal_connect('toggled') {on_checkbutton_toggled(checkbutton2)}
grid.attach(checkbutton2, 0, 1, 1, 1)
checkbutton3 = Gtk::CheckButton.new('Red Kite')
checkbutton3.signal_connect('toggled') {on_checkbutton_toggled(checkbutton3)}
grid.attach(checkbutton3, 0, 2, 1, 1)

window.show_all

Gtk.main
