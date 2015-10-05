#!/usr/bin/env ruby

require 'gtk3'

def on_toggle widget
    active = widget.active? ? true : false

    if active == true
        print widget.label + " has been selected\n"
    end
end

window = Gtk::Window.new
window.set_title('RadioButton')
window.signal_connect("delete-event") {
    Gtk::main_quit
}

grid = Gtk::Grid.new
window.add(grid)

radiobutton1 = Gtk::RadioButton.new("Science")
radiobutton1.signal_connect('toggled') do |widget| on_toggle widget end
grid.attach(radiobutton1, 0, 0, 1, 1)
radiobutton2 = Gtk::RadioButton.new("History")
radiobutton2.set_group(radiobutton1)
radiobutton2.signal_connect('toggled') do |widget| on_toggle widget end
grid.attach(radiobutton2, 0, 1, 1, 1)
radiobutton3 = Gtk::RadioButton.new("Computing")
radiobutton3.set_group(radiobutton1)
radiobutton3.signal_connect('toggled') do |widget| on_toggle widget end
grid.attach(radiobutton3, 0, 2, 1, 1)

window.show_all

Gtk.main
