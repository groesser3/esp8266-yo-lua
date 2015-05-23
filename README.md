#ESP8266-Yo-Lua

This is a simple [Yo]((https://www.justyo.co/)) client. It is written in LUA an runs on a ESP8266-wifi-module with the [NodeMCU-firmware](https://github.com/nodemcu/nodemcu-firmware). 

## Usage
After powering on, wait until the led goes off. Press the switch and the ESP8266-module connects to your wifi-access-point and sends a "Yo" to the user defined in the "config.lua" file. If sending was successfull, the led lights up. If you want to send another "Yo" just press the button again.

## Setup
* edit the config.lua file
* upload config.lua, init0.lua, yo.lua and init.lua to the ESP8266-01 Module
* use node.compile() to compile config.lua, init0.lua, yo.lua
* connect GPIO2--Led--Resitor--GND
* connect GPIO0--Switch--GND

## Prerequisites
* ESP8266-01 wifi module with NodeMCU-firmware (Version 0.9.6)
* Yo API-Key 

## Links
* [https://github.com/nodemcu/nodemcu-firmware](https://github.com/nodemcu/nodemcu-firmware)
* [https://dashboard.justyo.co/](https://dashboard.justyo.co/)
* [http://www.esp8266.com/](http://www.esp8266.com/)
 
## Licence/Copyright

Copyright (c) 2015 Groesser3

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.# esp8266-yo-lua
