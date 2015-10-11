#!/usr/bin/env ruby

require 'gtk3'

def on_changed widget
    print widget.value
    print "\n"
end

window = Gtk::Window.new
window.set_title('Scale')
window.set_default_size(200, -1)
window.signal_connect("delete-event") {
    Gtk::main_quit
}

scale = Gtk::Scale.new :horizontal
scale.set_range(0, 10)
scale.signal_connect('value-changed') do |widget| on_changed widget end
window.add(scale)

window.show_all

Gtk.main
