//
//  BluetoothAudioPreference.swift
//  sbc bitpool expander
//
//  Created by Alexander A. Kropotin on 06.12.2020.
//

import Cocoa

public protocol BluetoothAudioPreferences {
    
    func save(_ bitpoolDetail: BitpoolDetail!, channel: ChannelDetail!);
    
    func delete();
}
