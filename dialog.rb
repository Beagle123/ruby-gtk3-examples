#!/usr/bin/env ruby

require 'gtk3'

dialog = Gtk::Dialog.new
dialog.set_title('Dialog')
dialog.set_default_size(400, 300)
dialog.add_button('_Cancel', Gtk::ResponseType::CANCEL)
dialog.add_button('_OK', Gtk::ResponseType::OK)

response = dialog.run

if response == Gtk::ResponseType::OK
    puts "OK button clicked"
elsif response == Gtk::ResponseType::CANCEL
    puts "Cancel button clicked"
else
    puts "Dialog closed"
end

dialog.destroy
