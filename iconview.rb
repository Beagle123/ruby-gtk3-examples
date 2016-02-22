#!/usr/bin/env ruby

require 'gtk3'

def on_item_activated iconview
    iconview.selected_items.each{|treepath|
        treeiter = iconview.model.get_iter(treepath)
        value = iconview.model.get_value(treeiter, 0)
        puts 'Selected item: %s' % value
    }
end

distributions = ['gentoo', 'fedora', 'debian', 'zenwalk', 'mandriva']

window = Gtk::Window.new
window.set_title('IconView')
window.signal_connect('destroy') {
    Gtk::main_quit
}

image = Gtk::Image.new()
liststore = Gtk::ListStore.new(String, Gdk::Pixbuf, String)

distributions.each{|item|
    image.file = '_resources/' + item + '.ico'
    pixbuf = image.pixbuf

    treeiter = liststore.append()
    treeiter.set_value(0, item.capitalize)
    treeiter.set_value(1, pixbuf)
    treeiter.set_value(2, item.capitalize + ' tooltip example')
}

iconview = Gtk::IconView.new
iconview.set_model(liststore)
iconview.text_column = 0
iconview.pixbuf_column = 1
iconview.tooltip_column = 2
iconview.signal_connect('item-activated') do |iconview| on_item_activated iconview end
window.add(iconview)

window.show_all

Gtk.main
