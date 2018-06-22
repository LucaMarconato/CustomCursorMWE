//
//  ViewController.swift
//  customCursorMWE
//
//  Created by macbook on 21/06/2018.
//  Copyright © 2018 macbook. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSWindowDelegate {
    @IBOutlet weak var cursorView: CursorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }    
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    override func viewDidAppear() {
        super.viewDidAppear()
        cursorView.setCursor(withName: "highlighter_green")
    }
    
    func windowDidResize(_ notification: Notification) {
        return
    }
    @IBAction func greenPressed(_ sender: Any) {
        cursorView.setCursor(withName: "highlighter_green")
    }
    @IBAction func crosshairPressed(_ sender: Any) {
        cursorView.setCursor(withName: "selection")
    }
}

