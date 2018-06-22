//
//  ButtonsView.swift
//  customCursorMWE
//
//  Created by macbook on 21/06/2018.
//  Copyright © 2018 macbook. All rights reserved.
//

import Foundation
import Cocoa

class ButtonsView: NSView {
    var cursorView: CursorView!
    
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
}

class MyButton: NSButton {
    var buttonsView: ButtonsView!
    var s: String!
    
    @objc func pressed() {
        buttonsView.cursorView.setCursor(withName: s)
    }
}
