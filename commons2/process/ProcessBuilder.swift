//
//  ProcessBuilder.swift
//  simple ram disk
//
//  Created by Alexander A. Kropotin on 31.01.2021.
//

import Foundation

public protocol ProcessBuilder: class {
    
    init();
    
    init(at laucnhPath: String!);
    
    func at(at laucnhPath: String!) -> ProcessBuilder;
    
    func with(with arguments: [String]!) -> ProcessBuilder;
    
    func with(with argument: String!) -> ProcessBuilder;
    
    func build() -> Process;
}
