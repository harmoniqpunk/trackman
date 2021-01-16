# Logictech Trackman Marble - scroll, zoom, rotate with the ball on Mac OS, OSX
## Migrate scrolling wheel functions to tracking ball  



### Motivation

Logitech Trackman Marble is a great hardware product but whith not software support. Logitech, WTF?!!!

Nevermind. I have built support for functions using Hammerspoon.

### Features

- scroll with the tracking ball by holding down the Marble left-top-button while your rotate the ball
- middle click (wheel click) on the Marble right-top-button (this is usefulle to orbit in Blender for example while holding down middle click and rotate the ball)
- modifiers (CTRL, CMD, ALT, SHIFT) used with the above scroll feature and middle click (this is usefull for example to orbit in Fusion360 while you hold down SHIFT+middle click + ball rotation or in Figma to zoom by holding down CTRL+Scroll (left-top-button + ball rotation)
### How to Use

1. Download and Install Hammerspoon from [here](https://github.com/Hammerspoon/hammerspoon/releases/)
2. Download the [init.lua file](https://raw.githubusercontent.com/nauutilus/trackman/main/init.lua) to /Users/yourusername/.hammerspoon/init.lua. (NOTE: .hammerspoon folder is hidden bydefault - you can see it by pressing 
<code>CMD + SHIFT + . </code>)
3. Reload config on the drop down menu of the Hammerspoon icon you can find it on the Mac OS/OSX menu bar in the top-righ corner. 

4. Scroll whit the ball: hold down the left-top-button while you use the ball
5. Orbit in Blender: hold down the right-top-button while you use the ball
6. Orbit in Fusion360: hold down SHIFT+right-top-button while you use the ball
7. Zoom in Figma: hold down CTRL+Scroll (see section 4. for Scroll) 

### Customise

You can customise by changing the button number of these 2 locals in the init.lua file:

#### Default:
local leftAuxMouseButton = 3
local rightAuxMouseButton = 4

#### Logitech Trackman Marble buttons number:

left-bottom-button = 0 (left click)
left-top-button = 3 (aux click 1)

right-bottom-button = 1 (right click)
right-top-button = 4 (aux click 2)

