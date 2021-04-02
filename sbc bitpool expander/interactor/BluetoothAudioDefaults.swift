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
        let result = SimpleAppleScriptShellBuilder.init(at: "/bin/sh", with: true)
            .with(with: self.script)
            .with(with: "-s")
            .with(with: String(describing: bitpool.getMin()))
            .with(with: String(describing: bitpool.getMax()))
            .with(with: String(describing: bitpool.getCurr()))
            .build()
            .executeAndReturnError(nil);
        
        print(result)
    }
        
    public func delete() {
        let result = SimpleAppleScriptShellBuilder.init(at: "/bin/sh", with: true)
            .with(with: self.script)
            .with(with: "-d")
            .build()
            .executeAndReturnError(nil);
        
        print(result);
    }
}
