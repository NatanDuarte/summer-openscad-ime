
function bigger(a, b) = a > b ? a : b;

function mean(array) = (array.x + array.y + array.z) / 3;

function circleArea(radius) = pow(radius, 2) * PI;

function sphereVolume(diameter) = pow((diameter / 2), 3) * PI * (4/3);


echo("");
echo(str("bigger between 10 and 2 is: ", bigger(10, 2)));
echo(str("mean of the values 10, 8, 8 is: ", mean([10, 8, 8])));
echo(str("Circle area: ", circleArea(2)));
echo(str("Sphere volume: ", sphereVolume(10)));
echo("");
