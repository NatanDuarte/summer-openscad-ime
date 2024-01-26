objectScale = 2;
radius = 5;

cubeSize = [radius * 0.80, radius * 1.15, radius * 0.75];

scale(objectScale)  {
    union() {
        difference() {

        translate([0, 0, radius])
            sphere(r = radius, $fn=64);

        translate([cubeSize.x / 1.5, -cubeSize.y / 2, radius - cubeSize.z / 2])
            minkowski() {
                sphere(r=0.10 * radius, $fn=32);
                cube(cubeSize);
            }
        }

        translate([cubeSize.x / 1.5, 0, radius ]) 
            sphere(r=0.3 * radius, $fn=32);
    }
}