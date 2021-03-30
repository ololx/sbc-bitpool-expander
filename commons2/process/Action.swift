//
//  Action.swift
//  simple ram disk
//
//  Created by Alexander A. Kropotin on 24.03.2021.
//

import Foundation

public struct Action {
    
    public enum Method: Int {
        case LAUNCH = 0
        case LAUNCH_AND_WAIT = 1
    }
    
    private var process: Process!
    
    private var type: Method!
    
    public init(some process: Process!, type: Method!) {
        self.process = process;
        self.type = type;
    }
    
    public func getProcess() -> Process! {
        return self.process;
    }
    
    public func getType() -> Method {
        return self.type;
    }
}
