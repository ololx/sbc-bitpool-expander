//
//  ChannelDetail.swift
//  sbc bitpool expander
//
//  Created by Alexander A. Kropotin on 05.12.2020.
//

public struct ChannelDetail {
    
    public enum Modes: String {
        case NONE = "None"
        case MONO = "Mono"
        case DUAL_CHANNEL = "Dual Channel"
        case STEREO = "Stereo"
        case JOINT_STEREO = "Joint Stereo"
    }
    
    public class ChannelDetailBuilder {
        
        private var obj: ChannelDetail!;
        
        public init() {
            self.obj = ChannelDetail();
        }
        
        public func buid() -> ChannelDetail {
            return self.obj;
        }
        
        public func mode(_ mode: ChannelDetail.Modes!) -> ChannelDetailBuilder {
            self.obj.mode = mode;
            
            return self;
        }
    }
    
    public static func builder() -> ChannelDetailBuilder {
        return ChannelDetailBuilder();
    }
    
    //The channel mode value
    private var mode: Modes!;
    
    public init() {
        self.mode = Modes.NONE;
    }
    
    public init(_ mode: Modes!) {
        self.mode = mode;
    }
    
    public func getMode() -> ChannelDetail.Modes {
        return self.mode;
    }
    
    public func isPresent() -> Bool {
        return self.mode != Modes.NONE;
    }
}
