#!/usr/bin/env ruby

require 'gtk3'

def on_key_event window, event
    accelerator = Gtk::Accelerator.get_label(event.keyval, event.state)

    if accelerator == 'Ctrl+Mod2+F' || accelerator == 'Ctrl+F'
        if @searchbar.search_mode_enabled?
            @searchbar.search_mode_enabled = false
        else
            @searchbar.search_mode_enabled = true
        end
    end
end

window = Gtk::Window.new
window.set_title('SearchBar')
window.signal_connect('key-press-event') do |window, event| on_key_event window, event end
window.signal_connect('destroy') {
    Gtk::main_quit
}

grid = Gtk::Grid.new
window.add(grid)

label = Gtk::Label.new('Press Control+F to initiate search')
grid.attach(label, 0, 0, 1, 1)

@searchbar = Gtk::SearchBar.new
grid.attach(@searchbar, 0, 1, 1, 1)

searchentry = Gtk::SearchEntry.new
@searchbar.connect_entry(searchentry)
@searchbar.add(searchentry)

window.show_all

Gtk.main
