chairHeight = 15;

union() {
    translate([16, 8, chairHeight / 2]) cube([2.5, 2.5, 15], center=true);
    translate([-16, 8, chairHeight / 2]) cube([2.5, 2.5, 15], center=true);
    translate([16, -8, chairHeight / 2]) cube([2.5, 2.5, 15], center=true);
    translate([-16, -8, chairHeight / 2]) cube([2.5, 2.5, 15], center=true);

    difference() {
        translate([0, 0, chairHeight]) cube([44, 22, 3], center=true);
        translate([0, 0, chairHeight+2]) cube([38, 18, 2], center=true);
    }
}
