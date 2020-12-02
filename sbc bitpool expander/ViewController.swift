//
//  ViewController.swift
//  sbc bitpool expander
//
//  Created by Alexander A. Kropotin on 27.11.2020.
//

import Cocoa

class ViewController: NSViewController {
    
    //The dual channel mode value
    var dualChannelValue: Int32 = 1
    
    //The current/initial bitpool value
    var currBitpoolValue: Int32 = 2
    
    //The minimum bitpool value
    var minBitpoolValue: Int32 = 2
    
    //The maximum bitpool value
    var maxBitpoolValue: Int32 = 64
    
    var defaults: UserDefaults!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.defaults = UserDefaults.init(suiteName: "sbc-bitpool-expander") ?? UserDefaults.init();
        self.dualChannelValue = Int32(self.defaults.integer(forKey: "dualChannelValue"));
        self.minBitpoolValue = Int32(self.defaults.integer(forKey: "minBitpoolValue"));
        self.currBitpoolValue = Int32(self.defaults.integer(forKey: "currBitpoolValue"));
        self.maxBitpoolValue = Int32(self.defaults.integer(forKey: "maxBitpoolValue"));
    }

    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    @IBAction func changeDualChannelValue(_ sender: NSControl) {
        self.dualChannelValue = sender.intValue
    }

    @IBAction func changeCurrBitpoolValue(_ sender: NSControl) {
        self.currBitpoolValue = sender.intValue
    }
    
    @IBAction func changeMinBitpoolValue(_ sender: NSControl) {
        self.minBitpoolValue = sender.intValue
    }
    
    @IBAction func changeMaxBitpoolValue(_ sender: NSControl) {
        self.maxBitpoolValue = sender.intValue
    }
    
    @IBAction func setBluetoothAudio(_ sender: NSButton) {
        let dualChannelCommand = self.dualChannelValue == 1
            ? "defaults write bluetoothaudiod \\\"Apple channel type\\\" -string \\\"Dual Channel\\\";"
            : "defaults delete bluetoothaudiod \\\"Apple channel type\\\";";
        let result = self.execute(
            "defaults write bluetoothaudiod \\\"Apple Initial Bitpool\\\" -int \(self.currBitpoolValue);"
                + "defaults write bluetoothaudiod \\\"Apple Initial Min\\\" -int \(self.currBitpoolValue);"
                + "defaults write bluetoothaudiod \\\"Apple Bitpool Min\\\" -int \(self.minBitpoolValue);"
                + "defaults write bluetoothaudiod \\\"Apple Bitpool Max\\\" -int \(self.maxBitpoolValue);"
                + "defaults write bluetoothaudiod \\\"Negotiated Bitpool\\\" -int \(self.currBitpoolValue);"
                + "defaults write bluetoothaudiod \\\"Negotiated Bitpool Min\\\" -int \(self.minBitpoolValue);"
                + "defaults write bluetoothaudiod \\\"Negotiated Bitpool Max\\\" -int \(self.maxBitpoolValue);"
                + dualChannelCommand
                + "defaults read bluetoothaudiod;"
        );
        
        self.defaults.set(self.dualChannelValue, forKey: "dualChannelValue");
        self.defaults.set(self.currBitpoolValue, forKey: "currBitpoolValue");
        self.defaults.set(self.minBitpoolValue, forKey: "minBitpoolValue");
        self.defaults.set(self.maxBitpoolValue, forKey: "maxBitpoolValue");
        
        print(result ?? "")
    }
    
    @IBAction func resetBluetoothAudio(_ sender: NSButton) {
        self.execute("defaults delete bluetoothaudiod");
    }
    
    private func execute(_ command: String) -> String? {
        let script = "do shell script \"\(command)\" with administrator privileges";
        let executable = NSAppleScript.init(source: script);
        let output = executable?.executeAndReturnError(nil);
        
        return output?.stringValue;
    }
}

