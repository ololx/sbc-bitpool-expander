//
//  SbcService.swift
//  sbc bitpool expander
//
//  Created by Alexander A. Kropotin on 07.12.2020.
//

import Foundation

public class SbcService: SbcServiceProtocol {
     
    weak var sbcView: SbcView!
    
    var bluetoothAudioDefaults: BluetoothAudioDefaults!
    
    var sbcBitpoolExpanderDefaults: SbcBitpoolExpanderDefaults!
    
    init(sbcView: SbcView) {
        self.sbcView = sbcView;
        self.sbcBitpoolExpanderDefaults = SbcBitpoolExpanderDefaults.init();
    }
    
    func load() {
        let bitpool: BitpoolDetail = self.sbcBitpoolExpanderDefaults.getBitpool();
        self.sbcView.bitpoolCurrentInput.intValue = Int32(bitpool.getCurr());
        self.sbcView.bitpoolMinInput.intValue = Int32(bitpool.getMin());
        self.sbcView.bitpoolMaxInput.intValue = Int32(bitpool.getMax());
        
        let channel: ChannelDetail = self.sbcBitpoolExpanderDefaults.getChannnel();
        self.sbcView.dualChannelValue = channel.getMode() == ChannelDetail.Modes.DUAL_CHANNEL ? 1 : 0;
    }
    
    func set() {
        let bitpool: BitpoolDetail = BitpoolDetail.builder()
            .curr(Int(self.sbcView.bitpoolCurrentInput.intValue))
            .min(Int(self.sbcView.bitpoolMinInput.intValue))
            .max(Int(self.sbcView.bitpoolMaxInput.intValue))
            .buid();
        self.sbcBitpoolExpanderDefaults.setBitpool(bitpool);
        
        let channel: ChannelDetail = ChannelDetail.init(self.sbcView.dualChannelValue == 1 ? ChannelDetail.Modes.DUAL_CHANNEL : ChannelDetail.Modes.NONE);
        self.sbcBitpoolExpanderDefaults.setChannnel(channel);
        
        self.bluetoothAudioDefaults.save(bitpool, channel: channel);
    }
    
    func reset() {
        let bitpool: BitpoolDetail = BitpoolDetail.init();
        self.sbcBitpoolExpanderDefaults.setBitpool(bitpool);
        
        let channel: ChannelDetail = ChannelDetail.init();
        self.sbcBitpoolExpanderDefaults.setChannnel(channel);
        
        self.bluetoothAudioDefaults.save(bitpool, channel: channel);
    }
}
