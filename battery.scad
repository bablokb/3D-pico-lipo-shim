// -----------------------------------------------------------------------------
// 3D-Model (OpenSCAD): A case for the Pico with Pimoroni's Lipo-Shim
//
// This is the model for the battery-shield (modeled upside-down).
//
// Author: Bernhard Bablok
// License: GPL3
//
// https://github.com/bablokb/3D-pico-lipo-shim
// -----------------------------------------------------------------------------

include <dimensions.scad>
include <BOSL2/std.scad>

// --- battery-shield   --------------------------------------------------------

module shield() {
  z = b_bat + z_bat;

  difference() {
    // outer cube
    cuboid([x_bat,y_bat+2*w2,z],anchor=BOTTOM+CENTER);
  
    // inner cube
    move([-fuzz,0,b_bat]) cuboid([x_bat+2*fuzz,y_bat,z],anchor=BOTTOM+CENTER);
  }
}

// --- top-level object   ----------------------------------------------------

shield();
