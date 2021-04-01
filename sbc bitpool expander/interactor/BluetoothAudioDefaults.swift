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
        SimpleSequencing.init()
            .append(
                some: SimpleProcessBuilder.init(at: "/bin/sh")
                    .with(with: "-s")
                    .build()
            )
            .append(
                some: SimpleProcessBuilder.init(at: "/bin/sh")
                    .with(with: self.script)
                    .with(with: "-s")
                    .with(with: ["\(bitpool.getMin())", "\(bitpool.getCurr())", "\(bitpool.getMax())"])
                    .build(),
                actionType: Action.Method.LAUNCH_AND_WAIT
            )
            .execute();
    }
    
    public func delete() {
        SimpleSequencing.init()
            .append(
                some: SimpleProcessBuilder.init(at: "/bin/sh")
                    .with(with: "-s")
                    .build()
            )
            .append(
                some: SimpleProcessBuilder.init(at: "/bin/sh")
                    .with(with: self.script)
                    .with(with: "-r")
                    .build(),
                actionType: Action.Method.LAUNCH_AND_WAIT
            )
            .execute();
    }
}
