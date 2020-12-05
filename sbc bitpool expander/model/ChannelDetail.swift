//
//  ChannelMode.swift
//  sbc bitpool expander
//
//  Created by Alexander A. Kropotin on 05.12.2020.
//

import Foundation

public class ChannelDetail {
    
    public enum Modes {
        case MONO
        case DUAL_CHANNEL
        case STEREO
        case JOINT_STEREO
    }
    
    //The channel mode value
    private var mode: Modes?;
    
    public init() {
        self.mode = Modes.DUAL_CHANNEL;
    }
    
    public init(_ mode: Modes!) {
        self.mode = mode;
    }
}
