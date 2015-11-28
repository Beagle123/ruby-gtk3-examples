#!/usr/bin/env ruby

require 'gtk3'

def on_combobox_changed combobox
    model = combobox.model
    treeiter = combobox.active_iter
    text = model.get_value(treeiter, 0)

    print "Selected programming language is " + text + "\n"
end

window = Gtk::Window.new
window.set_title('ComboBox')
window.signal_connect('destroy') {
    Gtk::main_quit
}

liststore = Gtk::ListStore.new(String)

treeiter = liststore.append()
treeiter.set_value(0, 'Ruby')
treeiter = liststore.append()
treeiter.set_value(0, 'C++')
treeiter = liststore.append()
treeiter.set_value(0, 'Basic')

cellrenderertext = Gtk::CellRendererText.new

combobox = Gtk::ComboBox.new
combobox.set_model(liststore)
combobox.pack_start(cellrenderertext, true)
combobox.add_attribute(cellrenderertext, "text", 0)
combobox.set_active(0)
combobox.signal_connect('changed') do |widget| on_combobox_changed widget end
window.add(combobox)

window.show_all

Gtk.main
