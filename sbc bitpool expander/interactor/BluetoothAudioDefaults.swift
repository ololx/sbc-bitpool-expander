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
        SimpleSequencing.init()
            .append(
                some: SimpleProcessBuilder.init(at: "/bin/sh")
                    .with(with: "-s")
                    .build()
            )
            .append(
                some: SimpleProcessBuilder.init(at: "/bin/sh")
                    .with(with: "./sbc bitpool expander.app/Contents/Resources/resources/sbcbpexp.sh")
                    .with(with: "-s")
                    .with(with: ["\(bitpool.getMin())", "\(bitpool.getCurr())", "\(bitpool.getMax())"])
                    .build(),
                actionType: Action.Method.LAUNCH_AND_WAIT
            )
            .execute();
    }
    
    public func delete() {
        //let result = self.execute("defaults delete bluetoothaudiod; defaults read bluetoothaudiod;");
        
        print("");
    }
}
