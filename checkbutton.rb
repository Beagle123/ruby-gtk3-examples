#!/usr/bin/env ruby

require 'gtk3'

def on_toggle widget
    active = widget.active? ? true : false

    if active == true
        print widget.label + " has been spotted\n"
    end
end

window = Gtk::Window.new
window.set_title('CheckButton')
window.signal_connect('destroy') {
    Gtk::main_quit
}

grid = Gtk::Grid.new
window.add(grid)

checkbutton = Gtk::CheckButton.new('Goshawk')
checkbutton.signal_connect('toggled') do |widget| on_toggle widget end
grid.attach(checkbutton, 0, 0, 1, 1)
checkbutton = Gtk::CheckButton.new('Golden Eagle')
checkbutton.signal_connect('toggled') do |widget| on_toggle widget end
grid.attach(checkbutton, 0, 1, 1, 1)
checkbutton = Gtk::CheckButton.new('Red Kite')
checkbutton.signal_connect('toggled') do |widget| on_toggle widget end
grid.attach(checkbutton, 0, 2, 1, 1)

window.show_all

Gtk.main
