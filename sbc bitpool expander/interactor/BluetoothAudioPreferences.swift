//
//  BluetoothAudioPreference.swift
//  sbc bitpool expander
//
//  Created by Alexander A. Kropotin on 06.12.2020.
//

import Cocoa

public protocol BluetoothAudioPreferences: class {
    
    func save(_ bitpool: BitpoolDetail!, channel: ChannelDetail!);
    
    func delete();
}
