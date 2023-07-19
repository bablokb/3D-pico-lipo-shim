// -----------------------------------------------------------------------------
// 3D-Model (OpenSCAD): A case for the Pico with Pimoroni's Lipo-Shim
//
// This is the model for the top (lid) of the case.
//
// Author: Bernhard Bablok
// License: GPL3
//
// https://github.com/bablokb/3D-pico-lipo-shim
// -----------------------------------------------------------------------------

include <dimensions.scad>
include <BOSL2/std.scad>

// --- corpus of the lid   -----------------------------------------------------

module corpus_lid() {
  
  // base plate
  cuboid([xt_pico+2*w2,y_pico+2*w2,b_pico],anchor=BOTTOM+CENTER);
  
  // walls (will slip into the walls of the bottom part)
  rect_tube(size=[xt_pico,y_pico],wall=w2,h=b_pico+z_pico_top2,
                                                        anchor=BOTTOM+CENTER);
  // thicker wall for horizontal pins
  move([xo_hpins+gap/2,-y_pico/2,0])
    cuboid([x_hpins-gap,2*w2,b_pico+z_pico_top2-z_pico_top1],
                                                        anchor=BOTTOM+CENTER);
}

// --- lid   -----------------------------------------------------------------

module lid() {
  z_cutouts = b_pico+z_pico_top2-z_pico_top1 + fuzz;
  h_cutouts = z_pico_top2-z_pico_top1;
  difference() {
    corpus_lid();
    // usb
    move([xt_pico/2-w2/2,0,z_cutouts])
      cuboid([w2+2*fuzz,y_usb+2*gap,h_cutouts],anchor=BOTTOM+CENTER);
    // vertical pins (power)
    move([xo_hpins8,y_pico/2-y_hpins8/2-gap+fuzz,0])
      cuboid([x_hpins8,y_hpins8+2*gap,b_pico+z_pico_top2],anchor=BOTTOM+CENTER);
    // vertical pins (GP0/GP1)
    move([xo_hpins2,-y_pico/2+y_hpins2/2+gap-fuzz,0])
      cuboid([x_hpins2,y_hpins2+2*gap,b_pico+z_pico_top2],anchor=BOTTOM+CENTER);
    // horizontal pins
    move([xo_hpins+gap,-y_pico/2,z_cutouts])
      cuboid([x_hpins,2*w2,h_cutouts],anchor=BOTTOM+CENTER);
  }
}

// --- top-level object   ----------------------------------------------------

lid();
