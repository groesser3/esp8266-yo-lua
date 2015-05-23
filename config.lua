CONFIG = {}
CONFIG.WIFI_SSID =  "<your-wifi-ssid>"
CONFIG.WIFI_PWD = "<your-wifi-password>"

CONFIG.POST_BODY = "username=".. "<receiver-yo-username>" .. "&api_token=" .. "<sender-yo-api-key>" 
CONFIG.POST_LEN  = string.len(CONFIG.POST_BODY)
