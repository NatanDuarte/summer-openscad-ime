$fn=32;

crossBody = [4, 6, 33];

union() {
    translate([0, 0, crossBody.z + 2]) {
        difference() {
            rotate([0, 90, 0]) cylinder(h=crossBody.x -.5, r=3.5, center=true);
            rotate([0, 90, 0]) cylinder(h=crossBody.x, r=2, center=true);
        }
    }

    translate([0, 0, crossBody.z * .75]) 
        cube(
            [crossBody.x, crossBody.z * .5, crossBody.y], 
            center=true
        );

    translate([
        -1 * crossBody.x / 2, 
        -1 * crossBody.y / 2, 
        0
    ]) cube(crossBody);
}
