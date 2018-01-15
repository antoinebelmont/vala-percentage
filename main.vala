using Gtk;

/*int main(string[] args){
	Gtk.init(ref args);
	var builder = new Gtk.Builder();
	try{
		builder.add_from_file("percentages.ui");
	}catch(Error e){
		error("Something went wrong: %s ", e.message);
	}

	Gtk.Button result_button = builder.get_object("button1") as Gtk.Button;
	result_button.activate.connect(calculate);
	Gtk.Window window = builder.get_object("percentage") as Gtk.Window;
	//Gtk.Window window = new Gtk.Window();

	window.set_title("Hola Mundo");

	window.window_position = Gtk.WindowPosition.CENTER;
	window.set_default_size(300,500);

	window.destroy.connect(Gtk.main_quit);

	window.show_all();
	Gtk.main();
	return 0;
}

void calculate(){
	stdout.printf("Aquí haremos el cálculo");
}*/

class PercentageWindow : Gtk.ApplicationWindow{
	Gtk.Entry entry1 = new Gtk.Entry();
	Gtk.Entry entry2 = new Gtk.Entry();
	Gtk.Label total = new Gtk.Label("");
	internal PercentageWindow(PercentageApp app){
		Object (application: app, title: "Percentage app");
		var builder = new Gtk.Builder();
		try{
			builder.add_from_file("percentages.ui");
		}catch(Error e){
			error("Something went wrong: %s ", e.message);
		}
		this.set_resizable(false);

		entry1 = builder.get_object("entry1") as Gtk.Entry;
		entry2 = builder.get_object("entry2") as Gtk.Entry;
		total = builder.get_object("label2") as Gtk.Label;
		Gtk.Button result_button = builder.get_object("button1") as Gtk.Button;
		result_button.clicked.connect(calculate);
		var grid = builder.get_object("grid1") as Gtk.Grid;
		this.add(grid);
		grid.show();
	}
	void calculate(){
		double val1 = entry1.get_text().to_double();
		double val2 = entry2.get_text().to_double();
		total.set_text((((val2/val1) * 100) - 100).to_string());
	}
}

class PercentageApp : Gtk.Application{
	protected override void activate(){
		new PercentageWindow (this).show();
	}
	protected override void startup(){
		base.startup();
	}
}

int main(string[] args){
	return new PercentageApp ().run(args);
}
