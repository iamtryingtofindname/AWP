--[[


░█████╗░██╗░░░██╗████████╗██████╗░░█████╗░████████╗███████╗██████╗░
██╔══██╗██║░░░██║╚══██╔══╝██╔══██╗██╔══██╗╚══██╔══╝██╔════╝██╔══██╗
██║░░██║██║░░░██║░░░██║░░░██║░░██║███████║░░░██║░░░█████╗░░██║░░██║
██║░░██║██║░░░██║░░░██║░░░██║░░██║██╔══██║░░░██║░░░██╔══╝░░██║░░██║
╚█████╔╝╚██████╔╝░░░██║░░░██████╔╝██║░░██║░░░██║░░░███████╗██████╔╝
░╚════╝░░╚═════╝░░░░╚═╝░░░╚═════╝░╚═╝░░╚═╝░░░╚═╝░░░╚══════╝╚═════╝░

This is where the old AWP loader was located, and has now been replaced. This will still re-route to the new version, however we do not support this and it is important you update your script.

IMPORTANT:

This script may be removed at any point in time by the developers for any reason without head notice, so please replace your script.

If this script every breaks, it will not be fixed and will likely be removed instead.

The only reason this is still up is to give users some time to switch to the new script.

INSTRUCTIONS:

In order to update your script, you must replcace your AWP loader with the following script:

loadstring(game:HttpGet("http://rd2glory.com/AWP.lua"))()

And then you should be good to go!

]]

local b = Instance.new("BindableFunction")
b.OnInvoke = function(e)
    setclipboard(e=="Copy Discord Invite" and "https://discord.gg/xu5dDS3Pb9" or 'loadstring(game:HttpGet("http://rd2glory.com/AWP.lua"))()')
end
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "AWP Outdated",
	Text = "Update your script with the instructions below. This script may stop working at any time without a head notice.",
	Icon = "rbxassetid://10752665937",
	Duration = 8,
})
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Update Instructions",
	Text = "Change your AWP script to the one in the #get-script channel and you should be good!",
	Icon = "rbxassetid://10752665937",
	Duration = 15,
	Button1 = "Copy Invite",
	Button2 = "Copy Script",
	Callback = b
})

loadstring(game:HttpGet("http://rd2glory.com/AWP.lua"))()
