// -----------------------------------------------------------------------------
// 3D-Model (OpenSCAD): A case for the Pico with Pimoroni's Lipo-Shim
//
// Author: Bernhard Bablok
// License: GPL3
//
// https://github.com/bablokb/3D-pico-lipo-shim
// -----------------------------------------------------------------------------

$fa = 1;
$fs = 0.4;
$fn = 48;

fuzz = 0.01;
w2 = 0.86;                 // 2 walls Prusa3D
w4 = 1.67;                 // 4 walls Prusa3D
gap = 0.2;                 // gap pcb to case

// battery dimensions
x_bat = 37;                // bat-size: 36.5 x 20.5 x 5
y_bat = 21;
z_bat = 6;
b_bat = 0.6;

// LipoShim dimensions
z_shim_pcb = 1;

// pico dimensions
b_pico = 1.2;
x_pico = 51;                          // pico-size: 51 x 21 x (6.5/1.6/2.6)
xt_pico = x_pico + 0.2;               // pico-pcb is slightly bigger than in theory
y_pico = y_bat + 2*w2 + 2*gap;        // larger than 21
z_pico_bot = 7;                       // Lipo-Shim + PH2-connector
z_pico_pcb = 1.6;
z_pico_top1 = 3;                      // above pcb, up to horizontal pins
z_pico_top2 = 7;                      // above pcb, 4mm below top of vertical pins

z_pico     = b_pico + z_bat + b_bat + z_pico_bot + z_pico_pcb + z_pico_top2;

// support
z_sup = b_pico + z_bat + b_bat + z_pico_bot;
d_sup_o = 3.8;                  // outer diameter support
d_sup_i = 2.1;                  // inner diameter support
z_sup_i = z_sup - b_pico;       // inner pocket-height
xo_sup = 2;                     // x-offset from rim
yo_sup = 5.7;                   // y-offset from center

// cutout usb + button
y_usb = 8 + 2*gap;
y_btn = 7 + 2*gap;
z_btn = 3.5;

// cutout horizontal pins
x_hpins = 26.3;
xo_hpins = xt_pico/2 - 5 - x_hpins/2;                   // offset from right side

// cutout vertical pins
x_hpins2 = 5;
y_hpins2 = 3;
xo_hpins2 = xt_pico/2 - x_hpins2/2 + fuzz;

x_hpins8 = 20.5 + gap;
y_hpins8 = 3;
xo_hpins8 = xt_pico/2 - x_hpins8/2 + fuzz;

// cutout holes
d_led = 4;
xo_led = xt_pico/2 - xo_sup - d_led;
z_led = z_sup - d_led/2;
