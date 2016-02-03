#!/usr/bin/env ruby

require 'gtk3'

window = Gtk::Window.new
window.set_title('Toolbar')
window.signal_connect('destroy') {
    Gtk::main_quit
}

grid = Gtk::Grid.new
window.add(grid)

toolbar = Gtk::Toolbar.new
toolbar.set_vexpand(false)
toolbar.set_hexpand(true)
grid.attach(toolbar, 0, 0, 1, 1)

toolbutton1 = Gtk::ToolButton.new
toolbutton1.set_label('Play')
toolbar.add(toolbutton1)

toolbutton2 = Gtk::ToggleToolButton.new
toolbutton2.set_label('Pause')
toolbar.add(toolbutton2)

toolbutton3 = Gtk::RadioToolButton.new
toolbutton3.set_icon_name('gtk-media-rewind')
toolbar.add(toolbutton3)
toolbutton4 = Gtk::RadioToolButton.new
toolbutton4.set_icon_name('gtk-media-forward')
toolbutton4.set_group(toolbutton3)
toolbar.add(toolbutton4)

toolbutton5 = Gtk::MenuToolButton.new
toolbutton5.set_label('History')
toolbar.add(toolbutton5)

menu = Gtk::Menu.new
toolbutton5.set_menu(menu)

menuitem = Gtk::MenuItem.new
menuitem.set_label('MenuItem')
menu.append(menuitem)
menu.show_all

window.show_all

Gtk.main
