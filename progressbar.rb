#!/usr/bin/env ruby

require 'gtk3'

def progress_timeout progressbar
    value = progressbar.fraction + 0.01
    value = 0.0 if value > 1.0
    progressbar.fraction = value
    true
end

def on_show_text_toggled checkbutton, progressbar
    progressbar.show_text = checkbutton.active? ? true : false
end

window = Gtk::Window.new
window.set_title('ProgressBar')
window.signal_connect('destroy') {
    Gtk::main_quit
}

grid = Gtk::Grid.new
window.add(grid)

progressbar = Gtk::ProgressBar.new
progressbar.set_hexpand(true)
grid.attach(progressbar, 0, 0, 1, 1)

checkbutton = Gtk::CheckButton.new('Show Text')
checkbutton.signal_connect('toggled') do on_show_text_toggled(checkbutton, progressbar) end
grid.attach(checkbutton, 0, 1, 1, 1)

window.show_all

GLib::Timeout.add(50) do progress_timeout(progressbar) end

Gtk.main
