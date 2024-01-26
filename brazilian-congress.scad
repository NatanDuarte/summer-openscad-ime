//finalScale = 1;

base = [25, 60, 14];
towers = [15, 8, 45];

scale(finalScale) {
    translate([base.x * -1.5, 0, 0])
        cube(towers);

    translate([base.x * -1.5, towers.y * 1.5, 0])
        cube([towers.x, towers.y, towers.z]);

    union() {
        translate([base.x * -0.5, base.y * -0.5, 0]) 
            cube(base);

        translate([0, -15, 12])
            sphere(10);
    }

    difference() {
        translate([0, 15, 22])
            sphere(10);

        translate([-10, 5, 22])
            cube([20, 20, 20]);
    }
}
