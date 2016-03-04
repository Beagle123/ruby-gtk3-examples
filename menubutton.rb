#!/usr/bin/env ruby

require 'gtk3'

window = Gtk::Window.new
window.set_title('MenuButton')
window.signal_connect('destroy') {
    Gtk::main_quit
}

menubutton = Gtk::MenuButton.new()
menubutton.set_label('MenuButton')
window.add(menubutton)

menu = Gtk::Menu.new()
menubutton.set_popup(menu)

for count in 1..5
    menuitem = Gtk::MenuItem.new('MenuItem %i' % count)
    menu.append(menuitem)
end

menu.show_all
window.show_all

Gtk.main
