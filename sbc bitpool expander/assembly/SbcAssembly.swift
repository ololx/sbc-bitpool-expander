//
//  SbcAssembly.swift
//  sbc bitpool expander
//
//  Created by Alexander A. Kropotin on 07.12.2020.
//

import Foundation

public class SbcAssembly: SbcAssemblyProtocol {
    
    func configure(with viewController: SbcViewController) {
        //Create components
        let sbcService = SbcService.init(view: viewController);
        let bluetoothAudioDefaults = BluetoothAudioDefaults.init(presenter: sbcService);
        let sbcBitpoolExpanderDefaults = SbcBitpoolExpanderDefaults.init(presenter: sbcService);
        
        //Inject components
        viewController.scbService = sbcService;
        sbcService.bluetoothAudioDefaults = bluetoothAudioDefaults;
        sbcService.sbcBitpoolExpanderDefaults = sbcBitpoolExpanderDefaults;
    }
}
