#!/usr/bin/env ruby

require 'gtk3'

def on_file_set(filechooserbutton)
    puts('File selected: %s' % filechooserbutton.filename)
end

window = Gtk::Window.new
window.set_title('FileChooserButton')
window.set_default_size(200, -1)
window.signal_connect('destroy') {
    Gtk::main_quit
}

filechooserbutton = Gtk::FileChooserButton.new(:title => 'Select File', :action => Gtk::FileChooser::Action::OPEN)
filechooserbutton.signal_connect('file-set') {on_file_set(filechooserbutton)}
window.add(filechooserbutton)

window.show_all

Gtk.main
