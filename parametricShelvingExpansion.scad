height              = 25.4 * 6;
couplerheight       = 25.4 * 1.47;
couplerod           = 25.4 * 1.48;

frictionstripdepth  = 25.4 * 0.04;
frictionstripwidth  = 25.4 * 0.1;

od                  = 25.4 * 1.62;
//od                = 25.4 * 1.75;
//od                = 25.4 * 2;
id                  = 25.4 * 1.51;

fn = 200;

color([0.5,0.5,0.5])
difference() {
        union(){
 
                // Main body
                cylinder($fn = fn, height, r1 = od/2, r2 = od/2);
            
                // Coupler
                translate([0,0,height])
                cylinder($fn = fn, couplerheight, r1 = couplerod/2, r2 = couplerod/2);
                
                // N/S friction strips
                translate([0,0,height+(couplerheight/2)])
                cube(size=[couplerod+frictionstripdepth,frictionstripwidth,couplerheight-5], center = true);
            
                // E/W friction strips
                rotate(90)
                translate([0,0,height+(couplerheight/2)])
                cube(size=[couplerod+frictionstripdepth,frictionstripwidth,couplerheight-5], center = true);
        }     
        union(){
                // Main bore
                cylinder($fn = fn, height+couplerheight, r1 = (couplerod/2)-(od-id)/2, r2 = (couplerod/2)-(od-id)/2);
            
                // internal taper           
                translate([0,0,couplerheight])
                cylinder($fn = fn, height-couplerheight-(couplerheight*0.25), r1 = (id/2), r2 = (couplerod/2)-(od-id)/2);
            
                //female socket
                cylinder($fn = fn, couplerheight, r1 = (id/2), r2 = (id/2));           
        }
}