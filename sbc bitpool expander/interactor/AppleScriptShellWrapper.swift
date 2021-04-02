//
//  AppleScriptShellWrapper.swift
//  sbc bitpool expander
//
//  Created by Alexander A. Kropotin on 02.04.2021.
//

import Foundation

public protocol AppleScriptShellBuilder {
    
    init();
    
    func append(some process: Process!) -> Sequencing;
    
    func append(some process: Process!, actionType: Action.Method) -> Sequencing;
    
    func start() -> Sequencing;
    
    func stop() -> Sequencing;
    
    func execute();
}
