//
//  ViewController.swift
//  sbc bitpool expander
//
//  Created by Alexander A. Kropotin on 27.11.2020.
//

import Cocoa

class SbcViewController: NSViewController {
    
    @IBOutlet weak var channelModeCheckbox: NSControl!
    
    @IBOutlet weak var bitpoolCurrentInput: NSTextField!
    
    @IBOutlet weak var bitpoolCurrentSlider: NSSlider!
    
    @IBOutlet weak var bitpoolMinInput: NSTextField!
    
    @IBOutlet weak var bitpoolMinSlider: NSSlider!
    
    @IBOutlet weak var bitpoolMaxInput: NSTextField!
    
    @IBOutlet weak var bitpoolMaxSlider: NSSlider!
    
    //The view configurator
    let configurator: SbcAssemblyProtocol = SbcAssembly.init();
    
    //The service instance
    var scbService: SbcService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Configure view
        configurator.configure(with: self)
        
        //Load initional values from local storage into view
        scbService.load()
    }

    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    @IBAction func setBluetoothAudio(_ sender: NSButton) {
        self.scbService.set();
    }
    
    @IBAction func resetBluetoothAudio(_ sender: NSButton) {
        self.scbService.reset();
    }
}

