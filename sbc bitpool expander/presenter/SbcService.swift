//
//  SbcService.swift
//  sbc bitpool expander
//
//  Created by Alexander A. Kropotin on 07.12.2020.
//

import Foundation

public class SbcService: SbcServiceProtocol {
     
    weak var view: SbcViewController!
    
    var bluetoothAudioDefaults: BluetoothAudioDefaults!
    
    var sbcBitpoolExpanderDefaults: SbcBitpoolExpanderDefaults!
    
    init(view: SbcViewController) {
        self.view = view;
    }
    
    public func load() {
        let bitpool: BitpoolDetail = self.sbcBitpoolExpanderDefaults.getBitpool();
        self.updateBitpoolView(bitpool: bitpool);
    }
    
    public func set() {
        let bitpool: BitpoolDetail = BitpoolDetail.builder()
            .curr(Int(self.view.bitpoolCurrentInput.intValue))
            .min(Int(self.view.bitpoolMinInput.intValue))
            .max(Int(self.view.bitpoolMaxInput.intValue))
            .buid();
        
        self.sbcBitpoolExpanderDefaults.setBitpool(bitpool);
        self.bluetoothAudioDefaults.save(bitpool);
        self.updateBitpoolView(bitpool: bitpool);
    }
    
    public func reset() {
        let bitpool: BitpoolDetail = BitpoolDetail.init();
        
        self.sbcBitpoolExpanderDefaults.setBitpool(bitpool);
        self.bluetoothAudioDefaults.save(bitpool);
        self.updateBitpoolView(bitpool: bitpool);
    }
    
    private func updateBitpoolView(bitpool: BitpoolDetail) {
        self.view.bitpoolCurrentInput.intValue = Int32(bitpool.getCurr());
        self.view.bitpoolMinInput.intValue = Int32(bitpool.getMin());
        self.view.bitpoolMaxInput.intValue = Int32(bitpool.getMax());
    }
}
