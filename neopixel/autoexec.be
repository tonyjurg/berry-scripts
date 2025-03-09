# Import the animate module
import animate

# Set the duration of the animation in milliseconds
var duration = 4000 # 4 seconds

# Define the start and end LEDs for the oscillator animation. This is for 10 LEDs
var startLED = 0
var endLED = 9

# Create a strip of LEDs with 11 LEDs connected to GPIO9 (physical pin 5 on J2) on WEMOS S2 Mini v1.0.0) and using channel 0
# J2 is the leftmost pin row (outer) when the USB connector is at the bottom (component side view). Pinnumbering starts with '1' from the top. 
# The J2 definition is found on https://www.wemos.cc/en/latest/_static/files/sch_s2_mini_v1.0.0.pdf
var strip1 = Leds(11, 9, nil, 0)

# Create an animation core for strip1
var anim1 = animate.core(strip1)

# Set the background color of the animation to 0x10BB10
anim1.set_back_color(0x10BB10)

# Create a pulse animation with color 0x17FF71, speed 2, and amplitude 5
var pulse1 = animate.pulse(0x17FF71, 2, 5)

# Create an oscillator animation that moves from startLED to endLED over the duration
var osc1 = animate.oscillator(startLED, endLED, duration, animate.TRIANGLE)

# Set the callback function for the oscillator animation to update the position of pulse1
osc1.set_cb(pulse1, pulse1.set_pos)

# Add the oscillator animation to the animation core
anim1.add_animator(osc1)

# Add the pulse animation as a painter to the animation core
anim1.add_painter(pulse1)

# Create a palette animation that changes the color of pulse1 over 30 seconds
var palette1 = animate.palette(animate.PALETTE_STANDARD_TAG, 30000)

# Set the callback function for the palette animation to update the color of pulse1
palette1.set_cb(pulse1, pulse1.set_color)

# Add the palette animation to the animation core
anim1.add_animator(palette1)

# Start the animation
anim1.start()

# Create strip2 with 11 LEDs connected to GPIO5 (physical pin3 on J2) and using channel 1
var strip2 = Leds(11, 5, nil, 1)

# Create an animation core for strip2
var anim2 = animate.core(strip2)
anim2.set_back_color(0x10BB10)

# Create a pulse animation with color 0x17FF71, speed 2, and amplitude 5
var pulse2 = animate.pulse(0x17FF71, 2, 5)

# Create an oscillator animation that moves from startLED to endLED over the duration
var osc2 = animate.oscillator(startLED, endLED, duration, animate.TRIANGLE)

# Set the callback function for the oscillator animation to update the position of pulse2
osc2.set_cb(pulse2, pulse2.set_pos)

# Add the oscillator animation to the animation core
anim2.add_animator(osc2)

# Add the pulse animation as a painter to the animation core
anim2.add_painter(pulse2)

# Create a palette animation that changes the color of pulse2 over 30 seconds
var palette2 = animate.palette(animate.PALETTE_STANDARD_TAG, 30000)

# Set the callback function for the palette animation to update the color of pulse2
palette2.set_cb(pulse2, pulse2.set_color)

# Add the palette animation to the animation core
anim2.add_animator(palette2)

# Start the animation
anim2.start()