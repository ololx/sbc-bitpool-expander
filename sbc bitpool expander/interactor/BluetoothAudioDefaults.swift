//
//  BluetoothAudioDefaults.swift
//  sbc bitpool expander
//
//  Created by Alexander A. Kropotin on 06.12.2020.
//

import Cocoa

public class BluetoothAudioDefaults : BluetoothAudioPreferences {
    
    public func save(_ bitpoolDetail: BitpoolDetail!, channel: ChannelDetail!) {
        var dualChannelCommand: String = "";
        if (channel.mode == ChannelDetail.Modes.DUAL_CHANNEL) {
            dualChannelCommand = "defaults write bluetoothaudiod \\\"Apple channel type\\\" -string \\\"Dual Channel\\\";";
        } else {
            dualChannelCommand = "defaults delete bluetoothaudiod \\\"Apple channel type\\\";";
        }
    
        let result = self.execute(
            "defaults write bluetoothaudiod \\\"Apple Initial Bitpool\\\" -int \(String(describing: bitpoolDetail.curr));"
                + "defaults write bluetoothaudiod \\\"Apple Initial Min\\\" -int \(String(describing: bitpoolDetail.min));"
                + "defaults write bluetoothaudiod \\\"Apple Bitpool Min\\\" -int \(String(describing: bitpoolDetail.min));"
                + "defaults write bluetoothaudiod \\\"Apple Bitpool Max\\\" -int \(String(describing: bitpoolDetail.max));"
                + "defaults write bluetoothaudiod \\\"Negotiated Bitpool\\\" -int \(String(describing: bitpoolDetail.curr));"
                + "defaults write bluetoothaudiod \\\"Negotiated Bitpool Min\\\" -int \(String(describing: bitpoolDetail.min));"
                + "defaults write bluetoothaudiod \\\"Negotiated Bitpool Max\\\" -int \(String(describing: bitpoolDetail.max));"
                + dualChannelCommand
                + "defaults read bluetoothaudiod;"
        );
        
        print(result ?? "")
    }
    
    public func delete() {
        let result = self.execute("defaults delete bluetoothaudiod; defaults read bluetoothaudiod;");
        
        print(result ?? "");
    }
    
    
    private func execute(_ command: String) -> String? {
        let script = "do shell script \"\(command)\" with administrator privileges";
        let executable = NSAppleScript.init(source: script);
        let output = executable?.executeAndReturnError(nil);
        
        return output?.stringValue;
    }
}
