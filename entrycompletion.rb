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

countries = ['Ecuador', 'Brazil', 'Argentina', 'Cuba', 'Colombia']

window = Gtk::Window.new
window.set_title('EntryCompletion')
window.signal_connect('destroy') {
    Gtk::main_quit
}

grid = Gtk::Grid.new
grid.set_row_spacing(5)
window.add(grid)

liststore = Gtk::ListStore.new(String)

countries.each{|country|
    treeiter = liststore.append()
    treeiter.set_value(0, country)
}

entrycompletion = Gtk::EntryCompletion.new
entrycompletion.set_model(liststore)
entrycompletion.set_text_column(0)

entry = Gtk::Entry.new
entry.set_completion(entrycompletion)
grid.attach(entry, 0, 0, 1, 1)

radiobuttonPopup = Gtk::RadioButton.new('Popup Completion')
radiobuttonPopup.signal_connect('toggled') do |radiobuttonPopup| on_completion_toggled radiobuttonPopup, 0, entrycompletion end
grid.attach(radiobuttonPopup, 1, 0, 1, 1)
radiobuttonInline = Gtk::RadioButton.new('Inline Completion')
radiobuttonInline.set_group(radiobuttonPopup)
radiobuttonInline.signal_connect('toggled') do |radiobuttonInline| on_completion_toggled radiobuttonInline, 1, entrycompletion end
grid.attach(radiobuttonInline, 2, 0, 1, 1)

window.show_all

Gtk.main
