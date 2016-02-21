#!/usr/bin/env ruby

require 'gtk3'

def on_type_clicked message, infobar
    if message == 0
        infobar.set_message_type(Gtk::MessageType::INFO)
    elsif message == 1
        infobar.set_message_type(Gtk::MessageType::QUESTION)
    elsif message == 2
        infobar.set_message_type(Gtk::MessageType::WARNING)
    elsif message == 3
        infobar.set_message_type(Gtk::MessageType::ERROR)
    elsif message == 4
        infobar.set_message_type(Gtk::MessageType::OTHER)
    end

    infobar.show_all
end

window = Gtk::Window.new
window.set_title('InfoBar')
window.signal_connect('destroy') {
    Gtk::main_quit
}

grid = Gtk::Grid.new
grid.set_row_spacing(5)
grid.set_column_spacing(5)
window.add(grid)

label = Gtk::Label.new('InfoBar content string.')

infobar = Gtk::InfoBar.new
infobar.set_show_close_button(true)
infobar.content_area.add(label)
infobar.signal_connect('response') {infobar.hide}
grid.attach(infobar, 0, 0, 1, 1)

buttonbox = Gtk::ButtonBox.new :horizontal
grid.attach(buttonbox, 0, 1, 1, 1)

button = Gtk::Button.new :label => 'Information'
button.signal_connect('clicked') {on_type_clicked(0, infobar)}
buttonbox.add(button)
button = Gtk::Button.new :label => 'Question'
button.signal_connect('clicked') {on_type_clicked(1, infobar)}
buttonbox.add(button)
button = Gtk::Button.new :label => 'Warning'
button.signal_connect('clicked') {on_type_clicked(2, infobar)}
buttonbox.add(button)
button = Gtk::Button.new :label => 'Error'
button.signal_connect('clicked') {on_type_clicked(3, infobar)}
buttonbox.add(button)
button = Gtk::Button.new :label => 'Other'
button.signal_connect('clicked') {on_type_clicked(4, infobar)}
buttonbox.add(button)

window.show_all

Gtk.main
