//
//  View.swift
//  customCursorMWE
//
//  Created by macbook on 21/06/2018.
//  Copyright © 2018 macbook. All rights reserved.
//

import Foundation
import Cocoa

let cursors: [String] = [
    "highlighter_green",
    "selection"
]

class CursorView: NSView {
    var currentCursor: NSCursor? = nil
    var currentCursorRect: CGRect? = nil
    var currentCursorTrackingRectTag: NSView.TrackingRectTag? = nil
    var incumbentCursor: NSCursor? = nil
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    
    @objc func setCursor(withName name: String) {
        Swift.print("changing cursor to \(name)")
        incumbentCursor = getCursorFromString(name)
        self.window!.invalidateCursorRects(for: self)
    }
    
    override func resetCursorRects() {
        super.resetCursorRects()
        if(incumbentCursor != nil) {
            if(currentCursor != nil) {
                self.removeTrackingRect(currentCursorTrackingRectTag!)
                self.removeCursorRect(currentCursorRect!, cursor: currentCursor!)
            }
            currentCursor = incumbentCursor
            currentCursorRect = self.bounds
            self.addCursorRect(currentCursorRect!, cursor: currentCursor!)
            currentCursor!.setOnMouseEntered(true)
            currentCursorTrackingRectTag = self.addTrackingRect(self.bounds, owner: currentCursor!, userData: nil, assumeInside: true)
        }
    }
    
    func getCursorFromString(_ cursorName: String) -> NSCursor {
        let image = NSImage(named: NSImage.Name(rawValue: cursorName))!
        let cursor: NSCursor
        if(cursorName != "selection" && cursorName != "text" && cursorName != "rubber") {
            cursor = NSCursor(image: image, hotSpot: NSPoint(x: 1, y: 34))
        } else {
            cursor = NSCursor(image: image, hotSpot: NSPoint(x: 13, y: 13))
        }
        return cursor
    }
}
