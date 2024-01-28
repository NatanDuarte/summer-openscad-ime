$nf=64;


// 17.80 is equivalent to 18 in brazilian finger measure
rimRadius = 17.80;
rimTickness = 0.75;
rimWidth = 5;

plateFactor = 25;
plateWidth = 1;
plateHeight = 1;
plateMeasures = [plateFactor + plateWidth, plateFactor + plateHeight, rimWidth];

color([1, .9, 0])
difference() {
    hull() {
        cylinder(h=rimWidth, r=rimRadius + rimTickness);
        translate([plateMeasures.x * -0.5, rimRadius * -0.25, 0])
                cube(plateMeasures);
    }
    translate([0, 0, rimTickness * -0.5]) cylinder(h=rimWidth+2, r=rimRadius);
}
