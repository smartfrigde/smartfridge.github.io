# EOL Notice

**SmartCord is officially discontinued. No future updates will be available. If you are still using it to uninstall follow these instructions:**    
1.Find your Discord user data directory:     
<channel> refers to the Discord version channel (Stable, Canary, PTB, Development) you want to mod. Stable has no suffix.     
2.For Linux: ~/.config/discord<channel>/     
3.For Windows: %appdata%\discord<channel>\    
4.For Mac: ~/Library/Application Support/discord<channel>/    
5.There should be a settings.json, remove the following lines after the first line of the contents:    
`
  "UPDATE_ENDPOINT": "https://updates.goosemod.com/smartcord",
  "NEW_UPDATE_ENDPOINT": "https://updates.goosemod.com/smartcord/",`   
If you want a **much** better experience use GooseMod. Just replace `smartcord` to `goosemod` and you should be fine.   
# It's not the end tho... I'm working on rewrite/v2 but it's still on paper. I'd like to thank everyone who supported me and used SmartCord v1 it's a been great journey and good learning material
