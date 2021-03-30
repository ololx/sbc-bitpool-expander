//
//  Executable.swift
//  simple ram disk
//
//  Created by Alexander A. Kropotin on 31.01.2021.
//

import Foundation

public class Executable {
    
    public func execute(_ executable: () -> Void) {
        executable.();
    }
}
