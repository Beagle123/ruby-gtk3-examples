#!/usr/bin/env ruby

require 'gtk3'

window = Gtk::Window.new
window.set_title('Calendar')
window.signal_connect('destroy') {
    Gtk::main_quit
}

grid = Gtk::Grid.new
window.add(grid)

calendar = Gtk::Calendar.new
calendar.signal_connect('day-selected') {
    year, month, day = calendar.date
    date = "%i/%i/%i" % [year, month, day]

    puts 'Selected date: %s' % date
}
grid.attach(calendar, 0, 0, 1, 1)

box = Gtk::Box.new :vertical
grid.attach(box, 1, 0, 1, 1)

checkbuttonShowHeading = Gtk::CheckButton.new("Show Heading")
checkbuttonShowHeading.active = true
checkbuttonShowHeading.signal_connect('toggled') {
    active = checkbuttonShowHeading.active? ? true : false
    calendar.set_property("show-heading", active)
}
box.add(checkbuttonShowHeading)

checkbuttonShowDayNames = Gtk::CheckButton.new("Show Day Names")
checkbuttonShowDayNames.active = true
checkbuttonShowDayNames.signal_connect('toggled') {
    active = checkbuttonShowDayNames.active? ? true : false
    calendar.set_property("show-day-names", active)
}
box.add(checkbuttonShowDayNames)

checkbuttonNoMonthChange = Gtk::CheckButton.new("No Month Change")
checkbuttonNoMonthChange.signal_connect('toggled') {
    active = checkbuttonNoMonthChange.active? ? true : false
    calendar.set_property("no-month-change", active)
}
box.add(checkbuttonNoMonthChange)

checkbuttonShowWeekNumbers = Gtk::CheckButton.new("Show Week Numbers")
checkbuttonShowWeekNumbers.signal_connect('toggled') {
    active = checkbuttonShowWeekNumbers.active? ? true : false
    calendar.set_property("show-week-numbers", active)
}
box.add(checkbuttonShowWeekNumbers)

window.show_all

Gtk.main
