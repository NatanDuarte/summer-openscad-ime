$fn=60;

module copo(largura=15, detalhe=10, borda=1) {
    pontos = concat(
        [for (x = [0:1/detalhe:3]) [x, -x ^ 2]],
        [for (x = [3:-1/detalhe:0]) [x + borda, -x ^ 2]]
        );

    echo(pontos);
    union() {
        translate([0, 0, 9]) {
            rotate_extrude() {
                translate([-largura / 2, 0, 0]) polygon(points=pontos);
            }   
        }

        cylinder(r=largura/2 -3);
    }

}

module asa(diametro=1.5, distancia=2) {
    rotate([90, 110, 0]) {
        rotate_extrude(angle=180) {
            translate([diametro / 2 + distancia, 0, 0])
                circle(d=diametro);
        }
    }
}

module xicara() {
    difference() {
        union() {
            copo();
            translate([5, 0, 5]) {
                asa();        
            }
        }
    }
}

module pires() {
    intersection() {
        translate([0, 0, 0.5]) cube([30, 30, 1], center=true);
        translate([0, 0, 12]) sphere(d=30);
    }
}

union() {
    translate([0, 0, 1]) xicara();
    pires();
}
/* pires(); */
