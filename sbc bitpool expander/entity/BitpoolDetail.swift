//
//  BitpoolDetail.swift
//  sbc bitpool expander
//
//  Created by Alexander A. Kropotin on 02.12.2020.
//

public struct BitpoolDetail {
    
    public class BitpoolDetailBuilder {
        
        private var obj: BitpoolDetail!;
        
        public init() {
            self.obj = BitpoolDetail();
        }
        
        public func buid() -> BitpoolDetail {
            return self.obj;
        }
        
        public func curr(_ curr: Int!) -> BitpoolDetailBuilder {
            self.obj.curr = curr;
            
            return self;
        }
        
        public func min(_ min: Int!) -> BitpoolDetailBuilder {
            self.obj.min = min;
            
            return self;
        }
        
        public func max(_ max: Int!) -> BitpoolDetailBuilder {
            self.obj.max = max;
            
            return self;
        }
    }
    
    public static func builder() -> BitpoolDetailBuilder {
        return BitpoolDetailBuilder();
    }
    
    //The current/initial bitpool value
    private var curr: Int!
    
    //The minimum bitpool value
    private var min: Int!
    
    //The maximum bitpool value
    private var max: Int!
    
    init() {
        self.curr = 40;
        self.min = 2;
        self.max = 53;
    }
    
    public init(curr: Int!, min: Int!, max: Int!) {
        self.curr = curr;
        self.min = min;
        self.max = max;
    }
    
    public func getCurr() -> Int {
        return self.curr;
    }
    
    public func getMin() -> Int {
        return self.min;
    }
    
    public func getMax() -> Int {
        return self.max;
    }
}
