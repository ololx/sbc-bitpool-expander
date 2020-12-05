//
//  Bitpool.swift
//  sbc bitpool expander
//
//  Created by Alexander A. Kropotin on 02.12.2020.
//

import Foundation

public class BitpoolDetail {
    
    //The current/initial bitpool value
    private var curr: Int?;
    
    //The minimum bitpool value
    private var min: Int?;
    
    //The maximum bitpool value
    private var max: Int?;
    
    public init() {
    }
    
    public init(curr: Int, min: Int, max: Int) {
        self.curr = curr;
        self.min = min;
        self.max = max;
    }
}
