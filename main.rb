

#!/usr/bin/env ruby

require 'gtk3'

window = Gtk::Window.new
scroll1 = Gtk::ScrolledWindow.new
scroll2 = Gtk::ScrolledWindow.new
code_box = Gtk::TextView.new
paned = Gtk::Paned.new(:horizontal)
paned.position = 200

window.set_title('Gtk Examples!')
window.position = :center
window.resize 800, 800
window.signal_connect('destroy') {
    Gtk::main_quit
}

liststore = Gtk::ListStore.new(String, String)

Dir.glob("*.rb").each do |rb_file|
  treeiter = liststore.append()
  treeiter.set_value(0, rb_file)
end

treeview = Gtk::TreeView.new
treeview.set_model(liststore)
treeview.signal_connect("row_activated") do |view, path, col| 
    iter = view.model.get_iter(path)
    code_box.buffer.text = File.open(iter[0]).read
    while (Gtk.events_pending?)
      Gtk.main_iteration
    end    
    `ruby #{iter[0]}` 
end
cellrenderertext = Gtk::CellRendererText.new
treeviewcolumn = Gtk::TreeViewColumn.new('Program', cellrenderertext, 'text' => 0)
treeview.append_column(treeviewcolumn)

scroll1.add(treeview)
scroll2.add(code_box)
paned.add1(scroll1)
paned.add2(scroll2)
window.add(paned)


window.show_all

Gtk.main
