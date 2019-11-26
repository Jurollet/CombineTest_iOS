//
//  DebugToolKit.swift
//  CombineTest
//
//  Created by Pierre Felgines on 04/01/2019.
//

import Foundation
#if DEBUG_TOOL_KIT
import DBDebugToolkit
#endif

class DebugToolKit {

    func setup() {
#if DEBUG_TOOL_KIT
        DBDebugToolkit.setup()
#endif
    }
}
