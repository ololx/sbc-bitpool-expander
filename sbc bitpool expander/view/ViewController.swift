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
    
    var pref: BluetoothAudioPreferences!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.pref = BluetoothAudioDefaults();
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
        let bitpool: BitpoolDetail = BitpoolDetail.init();
        let channel: ChannelDetail = ChannelDetail.init(self.dualChannelValue == 1 ? ChannelDetail.Modes.DUAL_CHANNEL : ChannelDetail.Modes.NONE);
        
        self.pref.save(bitpool, channel: channel);
        
        self.defaults.set(self.dualChannelValue, forKey: "dualChannelValue");
        self.defaults.set(self.currBitpoolValue, forKey: "currBitpoolValue");
        self.defaults.set(self.minBitpoolValue, forKey: "minBitpoolValue");
        self.defaults.set(self.maxBitpoolValue, forKey: "maxBitpoolValue");
    }
    
    @IBAction func resetBluetoothAudio(_ sender: NSButton) {
        self.pref.delete();
    }
}

