//
//  AppDefaultsRepository.swift
//  sbc bitpool expander
//
//  Created by Alexander A. Kropotin on 02.12.2020.
//

import Foundation

public class AppDefaultsRepository {
    
    var defaults: UserDefaults!
    
    public init() {
        self.defaults = UserDefaults.init(suiteName: "sbc-bitpool-expander") ?? UserDefaults.init();
    }
}
