#!/usr/bin/env ruby

require 'gtk3'

window = Gtk::Window.new
window.set_default_size(200, 200)
window.set_title('ScaleButton')
window.signal_connect('destroy') {
    Gtk::main_quit
}

grid = Gtk::Grid.new
window.add(grid)

label = Gtk::Label.new("Play with button")

# the following line was causing an error.  Gtk::IconSize::IconSize depricated.
# According to docs, it works fine with no argument.  It displays a small button.
scalebutton = Gtk::ScaleButton.new #(Gtk::IconSize::IconSize::BUTTON)
scalebutton.set_icons(['gtk-goto-bottom', 'gtk-goto-top'])
scalebutton.set_value(50)
scalebutton.signal_connect("value-changed") {
    label.label = "ScaleButton value set to %.2f" % scalebutton.value
}
grid.attach(scalebutton, 0, 0, 1, 1)

grid.attach(label, 1, 0, 2, 1)

window.show_all

Gtk.main
