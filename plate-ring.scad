$fn=64;


module PlateRing(
    rimRadius = 17.80, // 17.80 is equivalent to 18 in brazilian finger measure
    rimTickness = 0.75,
    rimWidth = 5,

    plateWidth = 0.5,
    plateHeight = 0.5,
    minPlateWidth = 10,
    minPlateHeight = 10
) {
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
                    rimRadius * plateWidth + minPlateWidth,
                    rimRadius * plateHeight + minPlateHeight,
                    rimWidth
                ]
            );
        }

        translate([0, 0, rimTickness * -0.5]) {
            cylinder(h=rimWidth + 2, r=rimRadius);
        }
    }
}

PlateRing(plateWidth=0.8, plateHeight=0.6);

translate([50, 0, 0]) PlateRing(rimRadius=12);
