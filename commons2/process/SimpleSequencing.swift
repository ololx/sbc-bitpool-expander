//
//  ProcessChain.swift
//  simple ram disk
//
//  Created by Alexander A. Kropotin on 31.01.2021.
//

import Foundation

public class SimpleSequencing: Sequencing {
    
    private var actions: [Action]!
    
    public required init() {
        self.actions = [];
    }
    
    public func append(some process: Process!) -> Sequencing {
        self.append(some: process, actionType: Action.Method.LAUNCH);
         
        return self;
    }
    
    public func append(some process: Process!, actionType: Action.Method) -> Sequencing {
        self.actions.append(Action.init(some: process, type: actionType));
        
        return self;
    }
    
    public func start() -> Sequencing {
        for (action) in actions  {
            action.getProcess()!.launch();
            
            if (action.getType() == Action.Method.LAUNCH_AND_WAIT) {
                action.getProcess()!.waitUntilExit();
            }
        }
        
        return self;
    }
    
    public func stop() -> Sequencing {
        for (action) in actions  {
            if (action.getProcess()!.isRunning) {
                action.getProcess()!.terminate();
            }
        }
        
        return self;
    }
    
    public func execute() {
        self.start();
        self.stop()
    }
}
