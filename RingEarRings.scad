$fn = 64;
$fa = 1;
$fs = 0.4;

module EarRing(radius=10, ringGauge=1, pinTickness=0.25) {
    union() {
        rotate([0, 0, 60]) {
            rotate_extrude(angle=300) {
                translate([radius - ringGauge / 2, 0])
                        circle(d=pinTickness);
            }
        }
        difference() {
            rotate_extrude(angle=275) {
                translate([radius - ringGauge / 2, 0])
                    circle(d=ringGauge);
            }
            rotate_extrude(angle=30) {
                translate([radius - ringGauge / 2, 0])
                    circle(d=ringGauge * 0.7);
            }
        }
    }
}

for (i=[-40:40:20]) {
    translate([i, 0, 0]) {
        EarRing(radius=12, ringGauge=1.25);
    }
}
