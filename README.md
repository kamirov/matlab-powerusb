# MATLAB PowerUSB Wrappers
MATLAB wrappers for the powerUSB AC power controller's driver. This is essentially a power bar whose sockets can be enabled/disabled by USB (more information on [the PowerUSB website](http://www.pwrusb.com/)). This wrapper allows you to do so through MATLAB function calls. 

When I made this, PowerUSB didn't publicly release a 64-bit driver, so I couldn't use their API with my 64-bit MATLAB installation. They did have an executable though, so I made a few MATLAB wrappers that call it with the appropriate arguments. 

The functions call the pwrusbcmd executable, which along with the powerUSB driver (PwrUSBDll.dll) should be present in one directory. 


## Functions

#### `powerusb(outlet1, outlet2, outlet3)`

* Turns on/off corresponding outlets.
* The arguments are booleans. `true` turns the corresponding outlet on, `false` turns it off.

#### `powerusb_off()`

* Turns off all outlets.
* Wrapper for `powerusb(0, 0, 0)`.

#### `powerusb_on()`

* Turns on all outlets
* Wrapper for `powerusb(1, 1, 1)`.

## Attribution

These functions were written as part of my duties while employed at the Space Avionics and Instrumentation Laboratory (SAIL) at Ryerson University in Canada. Many thanks to John Enright for purchasing the power controller.