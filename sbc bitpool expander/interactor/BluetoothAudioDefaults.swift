//
//  BluetoothAudioDefaults.swift
//  sbc bitpool expander
//
//  Created by Alexander A. Kropotin on 06.12.2020.
//

import Foundation

public class BluetoothAudioDefaults: BluetoothAudioDefaultsProtocol {
    
    weak var presenter: SbcServiceProtocol!
    
    private var script: String!
    
    init(presenter: SbcServiceProtocol, script: String!) {
        self.presenter = presenter;
        self.script = script;
    }
    
    public func save(_ bitpool: BitpoolDetail!) {
        let writeCommand = """
        echo \\\"Set bitpool.\nThe new bitpool values are: \n min bitpool valie is \(bitpool.getMin())\n max bitpool value is \(bitpool.getMax())\\\";
        defaults write bluetoothaudiod \\\"Apple Bitpool Min\\\" -int \(bitpool.getMin());
        defaults write bluetoothaudiod \\\"Apple Bitpool Max\\\" -int \(bitpool.getMax());
        defaults write bluetoothaudiod \\\"Apple Initial Bitpool\\\" -int \(bitpool.getMin());
        defaults write bluetoothaudiod \\\"Apple Initial Bitpool Min\\\" -int \(bitpool.getMin());
        defaults write bluetoothaudiod \\\"Negotiated Bitpool\\\" -int \(bitpool.getMin());
        defaults write bluetoothaudiod \\\"Negotiated Bitpool Min\\\" -int \(bitpool.getMin());
        defaults write bluetoothaudiod \\\"Negotiated Bitpool Max\\\" -int \(bitpool.getMax());
        echo \\\"Reading bitpool\\\";
        defaults read bluetoothaudiod;
        """;
        
        let result = SimpleAppleScriptShellBuilder.init(with: true)
            .with(with: writeCommand)
            .build()
            .executeAndReturnError(nil);
        
        print(result);
    }
        
    public func delete() {
        let deleteCommand = """
        echo \\\"Delete bitpool\\\";
        defaults delete bluetoothaudiod;
        echo \\\"Reading bitpool\\\";
        defaults read bluetoothaudiod;
        """;
        let result = SimpleAppleScriptShellBuilder.init(with: true)
            .with(with: deleteCommand)
            .build()
            .executeAndReturnError(nil);
        
        print(result);
    }
}
