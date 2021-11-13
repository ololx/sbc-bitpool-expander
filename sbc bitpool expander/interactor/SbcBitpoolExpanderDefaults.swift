//
//  SbcBitpoolExpanderDefaults.swift
//  sbc bitpool expander
//
//  Created by Alexander A. Kropotin on 02.12.2020.
//

import Foundation

public class SbcBitpoolExpanderDefaults: SbcBitpoolExpanderDefaultsProtocol {
    
    var defaults: UserDefaults!

    weak var presenter: SbcServiceProtocol!
    
    init(presenter: SbcServiceProtocol) {
        self.presenter = presenter;
        self.defaults = UserDefaults.init(suiteName: "sbc-bitpool-expander") ?? UserDefaults.init();
    }
    
    public func setBitpool(_ bitpool: BitpoolDetail!) {
        self.defaults.setValuesForKeys([
            "min": bitpool.getMin(),
            "max": bitpool.getMax(),
        ]);
    }
    
    public func getBitpool() -> BitpoolDetail {
        return BitpoolDetail.builder()
            .min(self.defaults.integer(forKey: "min"))
            .max(self.defaults.integer(forKey: "max"))
            .buid();
    }
    
    public func setChannnel(_ channel: ChannelDetail!) {
        self.defaults.setValuesForKeys(["mode": channel.getMode().rawValue]);
    }
    
    public func getChannnel() -> ChannelDetail {
        return ChannelDetail.builder()
            .mode(ChannelDetail.Modes(rawValue: self.defaults.string(forKey: "mode") ?? "None"))
            .buid();
    }
}
