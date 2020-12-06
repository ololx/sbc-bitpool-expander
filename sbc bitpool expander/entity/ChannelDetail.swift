//
//  ChannelMode.swift
//  sbc bitpool expander
//
//  Created by Alexander A. Kropotin on 05.12.2020.
//
import Cocoa

public class ChannelDetail: NSObject {
    
    public enum Modes {
        case NONE
        case MONO
        case DUAL_CHANNEL
        case STEREO
        case JOINT_STEREO
    }
    
    //The channel mode value
    var mode: Modes!
    
    override public init() {
        self.mode = Modes.NONE;
    }
    
    public init(_ mode: Modes!) {
        self.mode = mode;
    }
}
