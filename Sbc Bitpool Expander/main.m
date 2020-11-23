//
//  main.m
//  Sbc Bitpool Expander
//
//  Created by Alexander A. Kropotin on 13.11.2020.
//

#import <Cocoa/Cocoa.h>
#import <AppleScriptObjC/AppleScriptObjC.h>

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
    }
    
    [[NSBundle mainBundle] loadAppleScriptObjectiveCScripts];
    return NSApplicationMain(argc, argv);
}
