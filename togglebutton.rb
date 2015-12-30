#!/usr/bin/env ruby

require 'gtk3'

def on_togglebutton_toggled(togglebutton)
    active = togglebutton.active? ? true : false

    if active
        puts '%s is on' % togglebutton.label
    else
        puts '%s is off' % togglebutton.label
    end
end

window = Gtk::Window.new
window.set_title('ToggleButton')
window.signal_connect('destroy') {
    Gtk::main_quit
}

grid = Gtk::Grid.new
window.add(grid)

togglebutton1 = Gtk::ToggleButton.new('ToggleButton 1')
togglebutton1.signal_connect('toggled') {on_togglebutton_toggled(togglebutton1)}
grid.attach(togglebutton1, 0, 0, 1, 1)

togglebutton2 = Gtk::ToggleButton.new('ToggleButton 2')
togglebutton2.signal_connect('toggled') {on_togglebutton_toggled(togglebutton2)}
grid.attach(togglebutton2, 0, 1, 1, 1)

window.show_all

Gtk.main
