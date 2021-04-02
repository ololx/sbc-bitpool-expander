//
//  BluetoothAudioDefaults.swift
//  sbc bitpool expander
//
//  Created by Alexander A. Kropotin on 06.12.2020.
//

import Cocoa

public class BluetoothAudioDefaults: BluetoothAudioDefaultsProtocol {
    
    weak var presenter: SbcServiceProtocol!
    
    private var script: String!
    
    init(presenter: SbcServiceProtocol, script: String!) {
        self.presenter = presenter;
        self.script = script;
    }
    
    public func save(_ bitpool: BitpoolDetail!) {
        let result = self.execute("sh " + self.script + " -s " + "\(bitpool.getMin()) \(bitpool.getMax()) \(bitpool.getCurr())");
        
        print(result ?? "")
    }
        
    public func delete() {
        let result = self.execute(self.script + " -d");
        
        print(result ?? "");
    }
    
    
    private func execute(_ command: String) -> String? {
        let script = "do shell script \"\(command)\" with administrator privileges";
        let executable = NSAppleScript.init(source: script);
        let output = executable?.executeAndReturnError(nil);
        
        return output?.stringValue;
    }
}
