//
//  Sequencing.swift
//  sbc bitpool expander
//
//  Created by Alexander A. Kropotin on 30.03.2021.
//

import Foundation

public protocol Sequencing {
    
    init();
    
    func append(some process: Process!) -> Sequencing;
    
    func append(some process: Process!, actionType: Action.Method) -> Sequencing;
    
    func start() -> Sequencing;
    
    func stop() -> Sequencing;
    
    func execute();
}
