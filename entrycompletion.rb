#!/usr/bin/env ruby

require 'gtk3'

def on_completion_toggled(radiobutton, mode, entrycompletion)
    active = radiobutton.active? ? true : false

    if active == true
        if mode == 0
            entrycompletion.set_popup_completion(true)
            entrycompletion.set_inline_completion(false)
        elsif mode == 1
            entrycompletion.set_popup_completion(false)
            entrycompletion.set_inline_completion(true)
        end
    end
end

window = Gtk::Window.new
window.set_title('EntryCompletion')
window.signal_connect('delete-event') {
    Gtk::main_quit
}

grid = Gtk::Grid.new
grid.set_row_spacing(5)
window.add(grid)

liststore = Gtk::ListStore.new(String)
treeiter = liststore.append
treeiter[0] = 'Ecuador'
treeiter = liststore.append
treeiter[0] = 'Brazil'
treeiter = liststore.append
treeiter[0] = 'Argentina'
treeiter = liststore.append
treeiter[0] = 'Cuba'
treeiter = liststore.append
treeiter[0] = 'Colombia'

entrycompletion = Gtk::EntryCompletion.new
entrycompletion.set_model(liststore)
entrycompletion.set_text_column(0)

entry = Gtk::Entry.new
entry.set_completion(entrycompletion)
grid.attach(entry, 0, 0, 1, 1)

radiobuttonPopup = Gtk::RadioButton.new('Popup Completion')
radiobuttonPopup.signal_connect('toggled') do |widget| on_completion_toggled widget, 0, entrycompletion end
grid.attach(radiobuttonPopup, 0, 1, 1, 1)
radiobuttonInline = Gtk::RadioButton.new('Inline Completion')
radiobuttonInline.set_group(radiobuttonPopup)
radiobuttonInline.signal_connect('toggled') do |widget| on_completion_toggled widget, 1, entrycompletion end
grid.attach(radiobuttonInline, 0, 2, 1, 1)

window.show_all

Gtk.main
