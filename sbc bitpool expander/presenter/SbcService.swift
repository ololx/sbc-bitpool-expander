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
    
    func load() {
        let bitpool: BitpoolDetail = self.sbcBitpoolExpanderDefaults.getBitpool();
        self.view.bitpoolCurrentInput.intValue = Int32(bitpool.getCurr());
        self.view.bitpoolMinInput.intValue = Int32(bitpool.getMin());
        self.view.bitpoolMaxInput.intValue = Int32(bitpool.getMax());
        
        let channel: ChannelDetail = self.sbcBitpoolExpanderDefaults.getChannnel();
        self.view.channelModeCheckbox.intValue = channel.getMode() == ChannelDetail.Modes.DUAL_CHANNEL ? 1 : 0;
    }
    
    func set() {
        let bitpool: BitpoolDetail = BitpoolDetail.builder()
            .curr(Int(self.view.bitpoolCurrentInput.intValue))
            .min(Int(self.view.bitpoolMinInput.intValue))
            .max(Int(self.view.bitpoolMaxInput.intValue))
            .buid();
        self.sbcBitpoolExpanderDefaults.setBitpool(bitpool);
        
        let channel: ChannelDetail = ChannelDetail.init(self.view.channelModeCheckbox.intValue == 1 ? ChannelDetail.Modes.DUAL_CHANNEL : ChannelDetail.Modes.NONE);
        self.sbcBitpoolExpanderDefaults.setChannnel(channel);
        
        self.bluetoothAudioDefaults.save(bitpool, channel: channel);
    }
    
    func reset() {
        let bitpool: BitpoolDetail = BitpoolDetail.init();
        self.sbcBitpoolExpanderDefaults.setBitpool(bitpool);
        
        let channel: ChannelDetail = ChannelDetail.init();
        self.sbcBitpoolExpanderDefaults.setChannnel(channel);
        
        self.bluetoothAudioDefaults.save(bitpool, channel: channel);
        
        self.load();
    }
}
