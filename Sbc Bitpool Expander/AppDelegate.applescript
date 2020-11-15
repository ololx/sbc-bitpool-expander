--
--  SbcBitpoolExpanderDelegate.applescript
--  Sbc Bitpool Expander
--
--  Created by Alexander A. Kropotin on 13.11.2020.
--  
--

script AppDelegate
	property parent : class "NSObject"
	
	-- IBOutlets
	property theWindow : missing value
    
    -- The current/initial bitpool value from slider
    property currentBitpoolValue : missing value
    
    -- The min bitpool value from slider
    property minBitpoolValue : missing value
    
    -- The max bitpool value from slider
    property maxBitpoolValue : missing value
	
	on applicationWillFinishLaunching_(aNotification)
		-- Insert code here to initialize your application before any files are opened 
	end applicationWillFinishLaunching_
	
	on applicationShouldTerminate_(sender)
		-- Insert code here to do any housekeeping before your application quits 
		return current application's NSTerminateNow
	end applicationShouldTerminate_
    
    -- When "Ok" button was clicked
    on okButtonClick_(sender)
        set runnableScript to "sudo defaults write bluetoothaudiod \"Apple Initial Bitpool\" -int " & currentBitpoolValue's intValue() & ";" & "sudo defaults write bluetoothaudiod \"Apple Initial Min\" -int " & minBitpoolValue's intValue() & ";" & "sudo defaults write bluetoothaudiod \"Apple Bitpool Min\" -int " & minBitpoolValue's intValue() & ";" & "sudo defaults write bluetoothaudiod \"Apple Bitpool Max\" -int " & maxBitpoolValue's intValue() & ";" & "sudo defaults write bluetoothaudiod \"Negotiated Bitpool\" -int " & currentBitpoolValue's intValue() & ";" & "sudo defaults write bluetoothaudiod \"Negotiated Bitpool Min\" -int " & minBitpoolValue's intValue() & ";" & "sudo defaults write bluetoothaudiod \"Negotiated Bitpool Max\" -int " & maxBitpoolValue's intValue() & ";" & "sudo defaults write bluetoothaudiod \"Apple channel type\" -string \"Dual Channel\""
        
        do shell script runnableScript with administrator privileges
    end buttonClick_
    
end script
