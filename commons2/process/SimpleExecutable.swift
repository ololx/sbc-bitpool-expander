//
//  SimpleExecutable.swift
//  simple ram disk
//
//  Created by Alexander A. Kropotin on 31.01.2021.
//

import Foundation

public class SimpleExecutable<E, R> {
    
    private var executable: (E) -> R;
    
    init(some executable: (E) -> R, with arg: E) {
        self.executable = executable;
    }
    
    public func execute(some executable: (E) -> R, with arg: E) -> R {
        return executable(arg);
    }
}

