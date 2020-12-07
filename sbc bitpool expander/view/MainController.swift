//
//  ViewController.swift
//  sbc bitpool expander
//
//  Created by Alexander A. Kropotin on 27.11.2020.
//

import Cocoa

class MainController: NSViewController {
    
    @IBOutlet weak var channelModeCheckbox: NSBox!
    
    @IBOutlet weak var bitpoolCurrentInput: NSTextField!
    
    @IBOutlet weak var bitpoolCurrentSlider: NSSlider!
    
    @IBOutlet weak var bitpoolMinInput: NSTextField!
    
    @IBOutlet weak var bitpoolMinSlider: NSSlider!
    
    @IBOutlet weak var bitpoolMaxInput: NSTextField!
    
    @IBOutlet weak var bitpoolMaxSlider: NSSlider!
    
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
    
    var conf: AppDefaults!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.pref = BluetoothAudioDefaults();
        self.conf = AppDefaults();
        
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
        self.bitpoolCurrentInput.intValue = sender.intValue
        self.bitpoolCurrentSlider.intValue = sender.intValue
    }
    
    @IBAction func changeMinBitpoolValue(_ sender: NSControl) {
        self.minBitpoolValue = sender.intValue
        self.bitpoolMinInput.intValue = sender.intValue
        self.bitpoolMinSlider.intValue = sender.intValue
    }
    
    @IBAction func changeMaxBitpoolValue(_ sender: NSControl) {
        self.maxBitpoolValue = sender.intValue
        self.bitpoolMaxInput.intValue = sender.intValue
        self.bitpoolMaxSlider.intValue = sender.intValue
    }
    
    @IBAction func setBluetoothAudio(_ sender: NSButton) {
        let bitpool: BitpoolDetail = BitpoolDetail.builder()
            .curr(Int(self.currBitpoolValue))
            .min(Int(self.minBitpoolValue))
            .max(Int(self.maxBitpoolValue))
            .buid();
        let channel: ChannelDetail = ChannelDetail.init(self.dualChannelValue == 1 ? ChannelDetail.Modes.DUAL_CHANNEL : ChannelDetail.Modes.NONE);
        
        print(bitpool)
        
        self.pref.save(bitpool, channel: channel);
        self.conf.setBitpool(bitpool);
    }
    
    @IBAction func resetBluetoothAudio(_ sender: NSButton) {
        self.pref.delete();
    }
}

