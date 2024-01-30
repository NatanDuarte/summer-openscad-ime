$fn=64;


module PlateRing(
    rimRadius = 8.7, // 8.7 is equivalent to 18 in brazilian finger measure
    rimTickness = 0.75,
    rimWidth = 4,
    plateWidth = 0.75,
    plateHeight = 0.5,
) {
    function plateLinearCoeficient(x, y) = x * y + x * 0.85;

    module Plate(plateMeasures) {
        translate([plateMeasures.x * -0.5, 0, 0]) {
            cube(plateMeasures);
        }
    }

    difference() {
        hull() {
            cylinder(h=rimWidth, r=rimRadius + rimTickness);
            Plate(
                plateMeasures = [
                    plateLinearCoeficient(rimRadius, plateWidth),
                    plateLinearCoeficient(rimRadius, plateHeight),
                    rimWidth
                ]
            );
        }

        translate([0, 0, rimTickness * -0.5]) {
            cylinder(h=rimWidth + 2, r=rimRadius);
        }
    }
}

PlateRing();

translate([50, 0, 0]) PlateRing(rimRadius=6, rimWidth=3);
translate([50, 50, 0]) PlateRing(rimRadius=4.5, rimWidth=2.5);
