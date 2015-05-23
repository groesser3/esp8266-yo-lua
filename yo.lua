
function connect_to_ap()
  local status = wifi.sta.status()
  print(".. wifi status ..")
  -- 0: STATION_IDLE, 
  -- 1: STATION_CONNECTING, 
  -- 2: STATION_WRONG_PASSWORD, 
  -- 3: STATION_NO_AP_FOUND, 
  -- 4: STATION_CONNECT_FAIL, 
  -- 5: STATION_GOT_IP
  print(status)
  if (status ~= 5) 
  then
    wifi.sta.config(CONFIG.WIFI_SSID, CONFIG.WIFI_PWD)
    tmr.delay(500000)
    wifi.sta.autoconnect(1)
    tmr.delay(3000000)
  end
  print(wifi.sta.status())
--  while( status == 1) do
--    status = wifi.sta.status()
--    print(status)
--  end 
  return wifi.sta.getip()
end


function set_yo_state(state)
  print(yo_state .. " -> " .. state)
  yo_state=state
  
  if (yo_state == "done") then
    print("led on")
    gpio.write(led_pin, gpio.HIGH)
  else
    print("led off")
    gpio.write(led_pin, gpio.LOW)
  end
end

function dns(conn,ip) 
  print("dns-callback")
  print(ip)
  if (yo_state ~= "done") then
    if (ip ~= "DNS Fail!")  then 
       set_yo_state("connecting")
       print(ip); conn:connect(80,ip) 
    else
       set_yo_state("dns_fail")
    end
  end
end

function send_yo()
  
  local conn=net.createConnection(net.TCP, 0)
  conn:on("receive", function(conn, payload) print(payload) end )
  conn:on("reconnection", function(conn) print("--reconnection--") end )
  conn:on("disconnection", function(conn) print("--disconnection--") end )
  conn:on("sent", function(conn) print("--sent--") end )

  conn:on("connection", function(conn, payload)
  --conn:connect(4567,"192.168.2.109", function(conn, payload) 
      print("--connection--") 
      print(node.heap())
      conn:send("POST /yo/ HTTP/1.0\r\n") 
      conn:send("Host: api.justyo.co\r\n") 
      conn:send("User-Agent: HTTPTool/1.0\r\n") 
      conn:send("Content-Type: application/x-www-form-urlencoded\r\n")
      conn:send("Accept: application/json\r\n")
      conn:send("Content-Length: ")
      conn:send(CONFIG.POST_LEN .. "\r\n\r\n")
      conn:send(CONFIG.POST_BODY .. "\r\n\r\n")
      
      print("post send")
      set_yo_state("done")
    end )
    tmr.delay(2000000)
    conn:dns("api.justyo.co", dns)
end

function yo()
  set_yo_state("start")
  print("wifi.STATION")  -- client mode
  wifi.setmode(wifi.STATION)

  print("connecting to access point")
  local ip = connect_to_ap()

  if (ip == nil) 
  then
    print("no internet conn")
    -- conn = nil
  else
    print("new tcp conn")
    send_yo() 
  end 

  print("-- do yo end --")

end

print("-- yo file end --")
