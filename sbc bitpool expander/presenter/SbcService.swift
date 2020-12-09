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
        let channel: ChannelDetail = self.sbcBitpoolExpanderDefaults.getChannnel();
        
        self.updateBitpoolView(bitpool: bitpool);
        self.updateChannelView(channel: channel);
    }
    
    public func set() {
        let bitpool: BitpoolDetail = BitpoolDetail.builder()
            .curr(Int(self.view.bitpoolCurrentInput.intValue))
            .min(Int(self.view.bitpoolMinInput.intValue))
            .max(Int(self.view.bitpoolMaxInput.intValue))
            .buid();
        let channel: ChannelDetail = ChannelDetail.init(self.view.channelModeCheckbox.intValue == 1 ? ChannelDetail.Modes.DUAL_CHANNEL : ChannelDetail.Modes.NONE);
        
        self.sbcBitpoolExpanderDefaults.setBitpool(bitpool);
        self.sbcBitpoolExpanderDefaults.setChannnel(channel);
        
        self.bluetoothAudioDefaults.save(bitpool, channel: channel);
        
        self.updateBitpoolView(bitpool: bitpool);
        self.updateChannelView(channel: channel);
    }
    
    public func reset() {
        let bitpool: BitpoolDetail = BitpoolDetail.init();
        let channel: ChannelDetail = ChannelDetail.init();
        
        self.sbcBitpoolExpanderDefaults.setBitpool(bitpool);
        self.sbcBitpoolExpanderDefaults.setChannnel(channel);
        
        self.bluetoothAudioDefaults.save(bitpool, channel: channel);

        self.updateBitpoolView(bitpool: bitpool);
        self.updateChannelView(channel: channel);
    }
    
    private func updateChannelView(channel: ChannelDetail) {
        self.view.channelModeCheckbox.intValue = channel.getMode() == ChannelDetail.Modes.DUAL_CHANNEL ? 1 : 0;
    }
    
    private func updateBitpoolView(bitpool: BitpoolDetail) {
        self.view.bitpoolCurrentInput.intValue = Int32(bitpool.getCurr());
        self.view.bitpoolMinInput.intValue = Int32(bitpool.getMin());
        self.view.bitpoolMaxInput.intValue = Int32(bitpool.getMax());
    }
}
