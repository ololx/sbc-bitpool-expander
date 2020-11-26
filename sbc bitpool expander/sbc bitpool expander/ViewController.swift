//
//  ViewController.swift
//  sbc bitpool expander
//
//  Created by Alexander A. Kropotin on 26.11.2020.
//

import Cocoa
import Foundation

class ViewController: NSViewController {
    
    //The dual channel mode checkbox
    @IBOutlet weak var dualChannel: NSButton!
    
    //The current/initial bitpool value
    var currentBitpoolValue: Int?
    
    //The minimum bitpool value
    var minBitpoolValue: Int?
    
    //The maximum bitpool value
    var maxBitpoolValue: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func set(_ sender: NSButton) {
        /*let dualChannelCommand = dualChannel.state.rawValue == 1
            ? "defaults write bluetoothaudiod \"Apple channel type\" -string \"Dual Channel\";"
            : "defaults write bluetoothaudiod \"Apple channel type\" -string \"Dual Channel\";";*/
        
        self.execute(
            "defaults write bluetoothaudiod \\\"Apple Initial Bitpool\\\" -int \(currentBitpoolValue ?? 53);"
                + "defaults write bluetoothaudiod \\\"Apple Initial Min\\\" -int \(minBitpoolValue ?? 53);"
                + "defaults write bluetoothaudiod \\\"Apple Bitpool Min\\\" -int \(minBitpoolValue ?? 53);"
                + "defaults write bluetoothaudiod \\\"Apple Bitpool Max\\\" -int \(maxBitpoolValue ?? 53);"
                + "defaults write bluetoothaudiod \\\"Negotiated Bitpool\\\" -int \(currentBitpoolValue ?? 53);"
                + "defaults write bluetoothaudiod \\\"Negotiated Bitpool Min\\\" -int \(minBitpoolValue ?? 53);"
                + "defaults write bluetoothaudiod \\\"Negotiated Bitpool Max\\\" -int \(maxBitpoolValue ?? 53);"
                //+ "defaults write bluetoothaudiod \\\"Negotiated Bitpool Max\\\" -int \(dualChannelCommand);"
        );
        
        print(currentBitpoolValue)
    }
    
    @IBAction func reset(_ sender: NSButton) {
        self.execute("defaults delete bluetoothaudiod");
    }
    
    private func execute(_ command: String) -> String? {
        let executable = "do shell script \"" + command + " with administrator privileges";
        let output = NSAppleScript.init(source: executable)?.executeAndReturnError(nil);
        
        return output?.stringValue;
    }
}

