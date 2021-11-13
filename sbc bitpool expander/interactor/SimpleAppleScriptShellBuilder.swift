//
//  SimpleAppleScriptShellBuilder.swift
//  sbc bitpool expander
//
//  Created by Alexander A. Kropotin on 02.04.2021.
//

import Foundation

public class SimpleAppleScriptShellBuilder: AppleScriptShellBuilder {
    
    private var launchPath: String! = "";
    
    private var launchArguments: [String]! = [];
    
    private var privileges: Bool! = false;
    
    public required init() {
    }
    
    public required init(at laucnhPath: String!) {
        self.at(at: laucnhPath);
    }
    
    public required init(with privileges: Bool!) {
        self.privileges = privileges;
    }
    
    public required init(at laucnhPath: String!, with privileges: Bool!) {
        self.at(at: laucnhPath);
        self.privileges(privileges);
    }
    
    public func at(at laucnhPath: String!) -> AppleScriptShellBuilder {
        self.launchPath = laucnhPath;
        
        return self;
    }
    
    public func privileges(_ privileges: Bool!) -> AppleScriptShellBuilder {
        self.privileges = privileges;
        
        return self;
    }
    
    public func with(with arguments: [String]!) -> AppleScriptShellBuilder {
        self.launchArguments.append(contentsOf: arguments);
        
        return self;
    }
    
    public func with(with argument: String!) -> AppleScriptShellBuilder {
        self.launchArguments.append(argument);
        
        return self;
    }
    
    public func build() -> NSAppleScript {
        var script = launchPath;
        for (arg) in launchArguments  {
            script = script! + " " + arg;
        }
        
        let instance = "do shell script \"\(script!)\" \(self.privileges ? "with administrator privileges" : "")";
        NSLog(instance);
        
        return NSAppleScript.init(source: instance)!;
    }
}
