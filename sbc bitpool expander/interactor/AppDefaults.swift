//
//  AppDefaults.swift
//  sbc bitpool expander
//
//  Created by Alexander A. Kropotin on 02.12.2020.
//

import Foundation

public class AppDefaults: AppConfigurations {
    
    var defaults: UserDefaults!
    
    public init() {
        self.defaults = UserDefaults.init(suiteName: "sbc-bitpool-expander") ?? UserDefaults.init();
    }
    
    public func setBitpool(_ bitpool: BitpoolDetail!) {
        self.defaults.setValuesForKeys([
            "curr": bitpool.getCurr(),
            "min": bitpool.getMin(),
            "max": bitpool.getMax(),
        ]);
    }
    
    public func getBitpool() -> BitpoolDetail {
        return BitpoolDetail.builder()
            .curr(self.defaults.integer(forKey: "curr"))
            .min(self.defaults.integer(forKey: "min"))
            .max(self.defaults.integer(forKey: "max"))
            .buid();
    }
    
    public func setChannnel(_ channel: ChannelDetail!) {
        self.defaults.setValuesForKeys(["mode": channel.getMode()]);
    }
    
    public func getChannnel() -> ChannelDetail {
        return ChannelDetail.builder()
            .mode(ChannelDetail.Modes(rawValue: self.defaults.string(forKey: "mode") ?? "None"))
            .buid();
    }
}