switch_pin = 3;  -- alt: 8 , GPIO0
gpio.mode(switch_pin, gpio.INPUT, gpio.PULLUP)

print(gpio.read(switch_pin))
tmr.delay(2500000)
print(gpio.read(switch_pin))

if (gpio.read(switch_pin)==1)
then
  print(" ... start ... ")
  require("config")
  require("yo")
  require("init0")
else
  print(":-)")
end 