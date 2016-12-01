$fn=120;

f_dia = 80;

g_translate_x = -29.5;
g_translate_y = -21.5;

module gopro(display = 0, power = 0, led = 0) {
    translate([-0.5,-0.5,-21]) cube([60,42,21]);
    translate([44,27.5,0]) cylinder(d=23.3, h=9);
    if(led != 0){
        translate([44,27.5,0]) difference() {
            cylinder(d=45.5, h=3);
            cylinder(d=32, h=3);
        }
    }
    if(display != 0){
        translate([3, 18,0]) cube([20, 20, 3]);
    }
    if(power != 0){
        translate([12,10,0]) cylinder(d=12, h=3);
    }
}

module pins() {
    translate([0,-35,0]) cylinder(d=4.3, h=3);
    translate([0, 35,0]) cylinder(d=4.3, h=3);
}

module scheibe0() {
    difference() {
        cylinder(d=f_dia, h=3);
        translate([
            g_translate_x,
            g_translate_y,
            0
        ]) gopro(display=1, power=1);
        pins();
    }
}

module scheibe1() {
    difference() {
        cylinder(d=f_dia, h=3);
        translate([
            g_translate_x,
            g_translate_y,
            0
        ]) gopro(power=1, led=1);
        pins();
    }
}

module scheibe2() {
    difference() {
        cylinder(d=f_dia, h=3);
        translate([
            g_translate_x,
            g_translate_y,
            3
        ]) gopro();
        pins();
    }
}

projection() {
translate([-85,0,0]) scheibe0();
                     scheibe1();
translate([ 85,0,0]) scheibe2();
}
//gopro();