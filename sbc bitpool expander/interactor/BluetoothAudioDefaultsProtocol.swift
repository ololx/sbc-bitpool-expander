//
//  BluetoothAudioDefaultsProtocol.swift
//  sbc bitpool expander
//
//  Created by Alexander A. Kropotin on 06.12.2020.
//

import Foundation

public protocol BluetoothAudioDefaultsProtocol: class {
    
    func save(_ bitpool: BitpoolDetail!);
    
    func delete();
}
