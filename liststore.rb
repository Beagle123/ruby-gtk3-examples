#!/usr/bin/env ruby

require 'gtk3'

window = Gtk::Window.new
window.set_title('ListStore')
window.signal_connect('destroy') {
    Gtk::main_quit
}

liststore = Gtk::ListStore.new(String, String)
treeiter = liststore.append()
treeiter.set_value(0, 'Apple')
treeiter.set_value(1, '£1.99')
treeiter = liststore.append()
treeiter.set_value(0, 'Cherry')
treeiter.set_value(1, '£2.49')
treeiter = liststore.append()
treeiter.set_value(0, 'Blueberry')
treeiter.set_value(1, '£3.19')

treeview = Gtk::TreeView.new
treeview.set_model(liststore)
window.add(treeview)

cellrenderertext = Gtk::CellRendererText.new
treeviewcolumn = Gtk::TreeViewColumn.new('Pie', cellrenderertext, 'text' => 0)
treeview.append_column(treeviewcolumn)
treeviewcolumn = Gtk::TreeViewColumn.new('Cost', cellrenderertext, 'text' => 1)
treeview.append_column(treeviewcolumn)

window.show_all

Gtk.main
