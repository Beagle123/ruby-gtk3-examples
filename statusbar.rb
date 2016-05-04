#!/usr/bin/env ruby

require 'gtk3'

@count = 0

def on_push_clicked
    @count += 1

    message = "Message number %i" % (@count)
    @statusbar.push(@context, message)
end

def on_pop_clicked
    @statusbar.pop(@context)
end

window = Gtk::Window.new
window.set_title('Statusbar')
window.signal_connect('destroy') {
    Gtk::main_quit
}

grid = Gtk::Grid.new
grid.set_row_spacing(5)
grid.set_column_spacing(5)
window.add(grid)

@statusbar = Gtk::Statusbar.new

buttonbox = Gtk::ButtonBox.new :horizontal
grid.attach(buttonbox, 0, 0, 1, 1)

buttonPush = Gtk::Button.new :label => 'Push'
buttonPush.signal_connect('clicked') {on_push_clicked}
buttonbox.add(buttonPush)

buttonPop = Gtk::Button.new :label => 'Pop'
buttonPop.signal_connect('clicked') {on_pop_clicked}
buttonbox.add(buttonPop)

@context = @statusbar.get_context_id('example')
grid.attach(@statusbar, 0, 1, 1, 1)

window.show_all

Gtk.main

