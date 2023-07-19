// -----------------------------------------------------------------------------
// 3D-Model (OpenSCAD): A case for the Pico with Pimoroni's Lipo-Shim
//
// This is the model for the bottom corpus of the case.
//
// Author: Bernhard Bablok
// License: GPL3
//
// https://github.com/bablokb/3D-pico-lipo-shim
// -----------------------------------------------------------------------------

include <dimensions.scad>
include <BOSL2/std.scad>

// --- support + thread-pocket   ---------------------------------------------

module pcb_support(add=0) {
  difference() {
    cyl(h=z_sup+add,d=d_sup_o,anchor=BOTTOM+CENTER);
    zmove(z_sup+add-z_sup_i+fuzz) cyl(h=z_sup_i,d=d_sup_i,anchor=BOTTOM+CENTER);
  }
}

// --- case (bottom-part)   --------------------------------------------------

module corpus_bottom() {
  x_sup_off = x_pico/2-xo_sup;
  
  // base plate
  cuboid([xt_pico+2*w2,y_pico+2*w2,b_pico],anchor=BOTTOM+CENTER);
  
  // walls
  rect_tube(isize=[xt_pico,y_pico],wall=w2,h=z_pico,anchor=BOTTOM+CENTER);
  
  // supports
  move([-x_sup_off,yo_sup,0]) pcb_support(add=z_shim_pcb);
  move([+x_sup_off,yo_sup,0]) pcb_support();
  move([-x_sup_off,-yo_sup,0]) pcb_support(add=z_shim_pcb);
  move([+x_sup_off,-yo_sup,0]) pcb_support();
  
}

// --- case   ----------------------------------------------------------------

module case() {
  difference() {
    corpus_bottom();
    // button
    move([xt_pico/2+w2/2,0,z_sup-z_btn])
       cuboid([w2+2*fuzz,y_btn,z_btn + z_pico_pcb],anchor=BOTTOM+CENTER);
    // usb
    move([xt_pico/2+w2/2,0,z_sup+z_pico_pcb])
       cuboid([w2+2*fuzz,y_usb,z_pico_top2 + z_pico_pcb + fuzz],anchor=BOTTOM+CENTER);
    // pins
    move([xo_hpins,y_pico/2+w2/2+fuzz,z_pico-z_pico_top2])
       cuboid([x_hpins,w2+2*fuzz,z_pico_pcb+z_pico_top2],
                                                        anchor=BOTTOM+CENTER);
    // holes (for the LipoShim-LEDs)
    move([xo_led,y_pico/2+w2/2,z_led])
      cyl(h=w2+2*fuzz,d=d_led,anchor=CENTER,orient=BACK);
    move([xo_led,-y_pico/2-w2/2,z_led])
      cyl(h=w2+2*fuzz,d=d_led,anchor=CENTER,orient=BACK);
  }
}

// --- top-level object   ----------------------------------------------------

case();
