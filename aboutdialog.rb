#!/usr/bin/env ruby

require 'gtk3'

logo = Gdk::Pixbuf.new('_resources/gtk.png', 64, 64)

aboutdialog = Gtk::AboutDialog.new
aboutdialog.set_title('AboutDialog')
aboutdialog.set_name('Programmica')
aboutdialog.set_version('1.0')
aboutdialog.set_comments('Programming, system and network administration resources')
aboutdialog.set_website('https://programmica.com/')
aboutdialog.set_website_label('Programmica Website')
aboutdialog.set_authors(['Andrew Steele'])
aboutdialog.set_logo(logo)

aboutdialog.run
aboutdialog.destroy
