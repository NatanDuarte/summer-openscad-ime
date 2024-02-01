
module Nintendo64(height=30, width=10, distance=10) {

    module center() {
        polygon(points = [
            [-distance / 2, height/2],
            [-distance / 2, 0],
            [distance / 2, -height/2],
            [distance / 2, 0],
        ]);
    }

    module N() {
        translate([0, -distance/2, height/2]) {
            rotate([90, 0, 0]) {
                linear_extrude(height = width) {
                    union() {
                        for (i = [-distance, distance]) {
                            translate([i, 0, 0]) {
                                square(size = [width, height], center=true);
                            }
                        }
                        center();
                    }
                }
            }
        }
    }

    module main() {
        for (i = [0:3]) {
            rotate(i * 90) N();
        }
    }

    main();
}

Nintendo64();
