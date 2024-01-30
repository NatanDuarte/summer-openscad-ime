$fn=64;


module PlateRing(
    rimRadius = 8.7, // 8.7 is equivalent to 18 in brazilian finger measure
    rimTickness = 0.75,
    rimWidth = 4,
    plateWidth = 0.75,
    plateHeight = 0.5,
) {
    function plateLinearCoeficient(x, y) = x * y + x * 0.85;

    function centralize(x) = x * -0.5;

    module Plate(measures) {
        translate([centralize(measures.x), 0, 0])
            cube(measures);
    }

    module Rim(width, radius) {
        cylinder(h=width, r=radius);
    }

    module Tickness(value) {
        translate([0, 0, centralize(value)])
            // I don't remember why I added 2 here but it is necessary
            cylinder(h=rimWidth + 2, r=rimRadius);
    }

    module RimPlateHull() {
        hull() {
            Rim(width=rimWidth, radius=rimRadius + rimTickness);
            Plate(measures = [
                plateLinearCoeficient(rimRadius, plateWidth),
                plateLinearCoeficient(rimRadius, plateHeight),
                rimWidth
            ]);
        }
    }

    module main() {
        difference() {
            RimPlateHull();
            Tickness(value = rimTickness);
        }
    }

    main();
}


PlateRing();

// more samples
// translate([50, 0, 0]) PlateRing(rimRadius=6, rimWidth=3);
// translate([50, 50, 0]) PlateRing(rimRadius=4.5, rimWidth=2.5);
