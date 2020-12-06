//
//  BitpoolDetail.swift
//  sbc bitpool expander
//
//  Created by Alexander A. Kropotin on 02.12.2020.
//
import Cocoa

public class BitpoolDetail: NSObject {
    
    //The current/initial bitpool value
    var curr: Int!;
    
    //The minimum bitpool value
    var min: Int!;
    
    //The maximum bitpool value
    var max: Int!;
    
    override public init() {
        self.curr = 40;
        self.min = 2;
        self.max = 53;
    }
    
    public init(curr: Int, min: Int, max: Int) {
        self.curr = curr;
        self.min = min;
        self.max = max;
    }
}
