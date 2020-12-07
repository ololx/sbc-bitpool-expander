//
//  AppConfigurations.swift
//  sbc bitpool expander
//
//  Created by Alexander A. Kropotin on 07.12.2020.
//

import Foundation

public protocol AppConfigurations: class {
    
    func setBitpool(_ bitpool: BitpoolDetail!);
    
    func getBitpool() -> BitpoolDetail;
    
    func setChannnel(_ channel: ChannelDetail!);
    
    func getChannnel() -> ChannelDetail;
}
