
$fn=20;

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
    translate([0,-35,-3]) cylinder(d=4.3, h=9);
    translate([0, 35,-3]) cylinder(d=4.3, h=9);
}

//translate([
//    g_translate_x,
//    g_translate_y,
//    3
//]) gopro(led=1);

module 2dring() {
    translate([41.25,11.5]) circle(d=2.5);
    translate([40,-3])      square([2.5,14.5]);
    translate([37.5,-21])   square([5,18]);
    translate([30,-23])     square([12.5,2]);
    translate([30,-39])     square([8,16]);
    translate([39.5,-37.5]) square([3,14.5]);
    translate([41,-37.5])     circle(d=3);
    
}
module 3dring() {
    rotate_extrude($fn=40) 2dring();
}

module schraubloecher(){
    translate([0,0, -0.5]) cylinder(d=8.2,h=.5);
    translate([0,0, -2.5]) cylinder(d2=8.2, d1=4.2, h=2);
    translate([0,0, -8.5]) cylinder(d=4.2, h=6);
    translate([0,0,-13.5]) cylinder(d=8.2, h=5, $fn=6);
}

module stehbolzen() {
    difference(){
        union(){
            translate([ 0, 35,-21]) cylinder(d=8, h=18);
            translate([-4, 35,-21]) cube([8,4,18]);
            translate([ 0,-35,-21]) cylinder(d=8, h=18);
            translate([-4,-39,-21]) cube([8,4,18]);
        }
        translate([0, 35,-15]) cylinder(d=4, h=12);
        translate([0,-35,-15]) cylinder(d=4, h=12);
    }
}

module halter() {
    translate([32,-20,-21]) cube([5.5,40,18]);
    translate([-37.5,-20,-21]) cube([5.5,40,18]);
    translate([30,-25,-21]) cube([2,50,18]);
    translate([-32,-25,-21]) cube([2,50,18]);
}

module teil() {
    difference(){
        union(){
            3dring();
            stehbolzen();
            halter();
        }
        translate([0,-42.5,-33]) 
            rotate([90,0,0]) schraubloecher();
        translate([0,42.5,-33]) 
            rotate([-90,0,0]) schraubloecher();
        translate([-42.5,0,-33]) 
            rotate([0,-90,0]) schraubloecher();
        translate([42.5,0,-33]) 
            rotate([0,90,0]) schraubloecher();
    }
}

difference(){
    union() {
        teil();
        //translate([-29.5,-21.5,0]) gopro();
    }
    //translate([-42.5,-42.5,-39]) cube([42.5,85,51.5]);
}