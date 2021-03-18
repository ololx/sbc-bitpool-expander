//
//  BluetoothAudioDefaults.swift
//  sbc bitpool expander
//
//  Created by Alexander A. Kropotin on 06.12.2020.
//

import Cocoa

public class BluetoothAudioDefaults: BluetoothAudioDefaultsProtocol {
    
    weak var presenter: SbcServiceProtocol!
    
    init(presenter: SbcServiceProtocol) {
        self.presenter = presenter;
    }
    
    public func save(_ bitpool: BitpoolDetail!) {
        let result = self.execute(
            "defaults write bluetoothaudiod \\\"Apple Initial Bitpool\\\" -int \(bitpool.getCurr());"
                + "defaults write bluetoothaudiod \\\"Apple Initial Min\\\" -int \(bitpool.getMin());"
                + "defaults write bluetoothaudiod \\\"Apple Bitpool Min\\\" -int \(bitpool.getMin());"
                + "defaults write bluetoothaudiod \\\"Apple Bitpool Max\\\" -int \(bitpool.getMax());"
                + "defaults write bluetoothaudiod \\\"Negotiated Bitpool\\\" -int \(bitpool.getCurr());"
                + "defaults write bluetoothaudiod \\\"Negotiated Bitpool Min\\\" -int \(bitpool.getMin());"
                + "defaults write bluetoothaudiod \\\"Negotiated Bitpool Max\\\" -int \(bitpool.getMax());"
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
