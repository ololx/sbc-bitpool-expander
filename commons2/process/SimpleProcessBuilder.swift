//
//  SimpleProcessBuilder.swift
//  simple ram disk
//
//  Created by Alexander A. Kropotin on 31.01.2021.
//

import Foundation

public class SimpleProcessBuilder: ProcessBuilder {
    
    private var launchPath: String! = "";
    
    private var launchArguments: [String]! = [];
    
    public required init() {
    }
    
    public required init(at laucnhPath: String!) {
        self.at(at: laucnhPath);
    }
    
    public func at(at laucnhPath: String!) -> ProcessBuilder {
        self.launchPath = laucnhPath;
        
        return self;
    }
    
    public func with(with arguments: [String]!) -> ProcessBuilder {
        self.launchArguments.append(contentsOf: arguments);
        
        return self;
    }
    
    public func with(with argument: String!) -> ProcessBuilder {
        self.launchArguments.append(argument);
        
        return self;
    }
    
    public func build() -> Process {
        let instance = Process.init();
        instance.launchPath = self.launchPath;
        instance.arguments = self.launchArguments;
        
        return instance;
    }
}
