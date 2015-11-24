#!/usr/bin/env ruby

require 'gtk3'

window = Gtk::Window.new
window.set_title('TreeStore')
window.signal_connect('destroy') {
    Gtk::main_quit
}

treestore = Gtk::TreeStore.new(String)
parent = treestore.append(nil)
parent.set_value(0, 'Jason Delaney')
child = treestore.append(parent)
child.set_value(0, 'j.delaney@frogmail.com')
parent = treestore.append(nil)
parent.set_value(0, 'Marcus Baldwin')
child = treestore.append(parent)
child.set_value(0, 'marcusbaldwin@delivery.net')
parent = treestore.append(nil)
parent.set_value(0, 'Louise Houston')
child = treestore.append(parent)
child.set_value(0, 'louise.f.houston@mariemail.co.uk')

treeview = Gtk::TreeView.new
treeview.set_model(treestore)
window.add(treeview)

cellrenderertext = Gtk::CellRendererText.new
treeviewcolumn = Gtk::TreeViewColumn.new('People', cellrenderertext, 'text' => 0)
treeview.append_column(treeviewcolumn)

window.show_all

Gtk.main
