$fn = 128;

total_height = 13.2;
ridge_height = 1.2;
pcb_height = 1.6;

usb_b_port_width = 12.5;
usb_b_port_height = 11.6;

module usb_b_port() {
	translate([-(usb_b_port_width / 2), -5,0])
		cube([usb_b_port_width, 18, usb_b_port_height]);
}

usb_c_port_width = 9;
usb_c_port_height = 3.25;
usb_c_port_radius = 1.25;
module usb_c_port() {
    r = usb_c_port_radius;
    w = usb_c_port_width;
    h = usb_c_port_height;
    
    translate([0,10,pcb_height])hull(){
        translate([-(w/2)+r, 0, -(h/2)+r])
            rotate([90,0,0])cylinder(h=18, r=r);
        translate([(w/2)-r, 0, -(h/2)+r])
            rotate([90,0,0])cylinder(h=18, r=r);
        translate([-(w/2)+r, 0, (h/2)-r])
            rotate([90,0,0])cylinder(h=18, r=r);
        translate([(w/2)-usb_c_port_radius, 0, (h/2)-r])
            rotate([90,0,0])cylinder(h=18, r=r);
    }
    
    translate([-(usb_c_port_width / 2), 1.5,0])
		cube([usb_c_port_width, 10, usb_c_port_height]);
    
    
    indentation_width = 15;
    indentation_height = 7.5;
    indentation_depth = 3.81;
    indentation_radius = 2;
    
    translate([-indentation_width/2, -4.01, 0])hull(){
        translate([indentation_width-indentation_radius, indentation_depth, indentation_height])
            rotate([90,0,0])cylinder(h=indentation_depth, r=indentation_radius);
        translate([+indentation_radius, indentation_depth, indentation_height])
            rotate([90,0,0])cylinder(h=indentation_depth, r=indentation_radius);
		cube([indentation_width, indentation_depth, indentation_height-indentation_radius]);
    }
}

module pegs() {
	translate([-12,6,0])
		cylinder(10, 2, 2);
	translate([12,6,0])
		cylinder(10, 2, 2);
}

module outer() {
    port_height = total_height;
    port_width_small = 20;
    port_width_big = 21;
    port_thickness = 4;
	
    translate([0, 0, 0.01])
        difference(){
            linear_extrude(height = port_height, scale = port_width_big/port_width_small) square(port_width_small, center = true);
            translate([-25/2,-20-port_thickness,-1])cube([25, 20, port_height+2]);
            translate([-25/2,3,-1])cube([25, 20, port_height+2]);
        }
}

module inner() {
	translate([-16, 0, 0.01])
		cube([32, 3, total_height + ridge_height]);
}

module base() {
	difference() {
		union() {
			translate([-16, 0, 0.01])
				cube([32, 6, 3]);
			translate([-12,6,0.01])
				cylinder(3, 4, 4);
			translate([12,6,0.01])
				cylinder(3, 4, 4);

			translate([-16, 0, 3])
				cube([32, 6, 3]);
		}
		union() {
			translate([-8,-5,0])
				cube([16, 18, 11]);

			translate([-16.1,6,6]) {
				rotate([0,90,0]) {
					cylinder(33, 3, 3);
				}
			}
		}
	}
}


module fill() {
	outer();
	inner();
	base();
}

//translate([88.78,-46,-pcb_height])rotate([0,0,180])color("blue")import("../pcb/modelh.stl");

difference() {
	fill();
	usb_c_port();
	pegs();
}
