tmr.stop(0)
tmr.stop(1)

YES = 0; NO = 1
led_pin = 4 -- alt:9 , GPIO2
do_yo = NO

yo_state="start"

led_pin = 4 -- alt:9 , GPIO2
gpio.mode(led_pin, gpio.OUTPUT)
gpio.write(led_pin, gpio.LOW)

gpio.mode(switch_pin, gpio.INT, gpio.PULLUP)

function pin(level)
  print("switch pressed")
  print(level)
  if (do_yo == NO) then
    set_yo_state("start")
    do_yo = YES
  end
end

gpio.trig(switch_pin, "down", pin)

tmr.alarm(1, 10000, 1, function()
   if (do_yo == YES and yo_state ~= "done") 
   then 
     print("do yo ...")
     yo()
     print("yo: " .. yo_state)
   else 
     print("yo: " .. yo_state)
   end
   if (yo_state == "done")
   then 
     do_yo = NO
   end    

 end )

print(" ... init0.lua loaded ... ")
