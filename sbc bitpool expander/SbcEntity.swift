//
//  SbcEntity.swift
//  sbc bitpool expander
//
//  Created by Alexander A. Kropotin on 02.12.2020.
//

import Foundation

public class SbcEntity {
    
    //The dual channel mode value
    private var dualChannelValue: Int?;
    
    //The current/initial bitpool value
    private var currBitpoolValue: Int?;
    
    //The minimum bitpool value
    private var minBitpoolValue: Int?;
    
    //The maximum bitpool value
    private var maxBitpoolValue: Int?;
    
    public init() {
    }
    
    public init(dualChannelValue: Int, currBitpoolValue: Int, minBitpoolValue: Int, maxBitpoolValue: Int) {
        self.dualChannelValue = dualChannelValue;
        self.currBitpoolValue = currBitpoolValue;
        self.minBitpoolValue = minBitpoolValue;
        self.maxBitpoolValue = maxBitpoolValue;
    }
    
    public func setDualChannelValue(_ dualChannelValue: Int) {
        self.dualChannelValue = dualChannelValue;
    }
}
