LADO = 50;
PROFUNDIDADE = 3;

module menger(n, lado) {
    lado_menor = lado / 3;
    cubos = [
        [[true, true, true],
         [true, false, true],
         [true, true, true]],
        
        [[true, false, true],
         [false, false, false],
         [true, false, true]],

        [[true, true, true],
         [true, false, true],
         [true, true, true]],
        ];

    if (n == 0) {
        cube(lado);
    }
    else {
        for (i = [0:2]) {
            for (j = [0:2]) {
                for (k = [0:2]) {
                    if (cubos[i][j][k]) {
                        translate(lado_menor * [i, j, k]) menger(n - 1, lado_menor);
                    }
                }
            }
        }
    }
}

menger(PROFUNDIDADE, LADO);