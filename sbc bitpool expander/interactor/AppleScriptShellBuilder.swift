//
//  AppleScriptShellBuilder.swift
//  sbc bitpool expander
//
//  Created by Alexander A. Kropotin on 02.04.2021.
//

import Foundation

public protocol AppleScriptShellBuilder {
    
    init();
    
    init(at laucnhPath: String!);
    
    init(with privileges: Bool!);
    
    init(at laucnhPath: String!, with privileges: Bool!);
    
    func at(at laucnhPath: String!) -> AppleScriptShellBuilder;
    
    func with(with arguments: [String]!) -> AppleScriptShellBuilder;
    
    func with(with argument: String!) -> AppleScriptShellBuilder;
    
    func build() -> NSAppleScript;
}
