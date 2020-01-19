//
//  ViewController.swift
//  CodeThatUp
//
//  Created by Kaan Ersan on 2020-01-19.
//  Copyright © 2020 Kaan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let startingValue = Int(("A" as UnicodeScalar).value) // 65
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = setup()
        self.view = view
        printAllSubViews(view: view, depth: 0)
    }
    
    func printAllSubViews(view: UIView, depth: Int) {
        var tabs = ""
        var i=0
        while i < depth {
            tabs = tabs.appending("\t")
            i += 1
        }
        
        if let unicodeScalar = UnicodeScalar(view.tag + startingValue) {
            print("\(tabs)\(Character(unicodeScalar))")
        }
        
        for subview in view.subviews where (subview is UILabel) == false {
            printAllSubViews(view: subview, depth: depth + 1)
        }
    }
    
    private func setup() -> UIView {
        let view = NamedView(tag: 0, frame: self.view.frame)
        view.backgroundColor = .white
        
        let redView = NamedView(tag: 1, frame: CGRect(x: 30.0, y: 90.0, width: 200.0, height: 200.0))
        redView.backgroundColor = UIColor.red
        
        let greenView = NamedView(tag: 2, frame: CGRect(x: 30.0, y: 60.0, width: 100.0, height: 60.0))
        greenView.backgroundColor = UIColor.green
        
        let blueView = NamedView(tag: 3, frame: CGRect(x: 20.0, y: 140.0, width: 30.0, height: 30.0))
        blueView.backgroundColor = UIColor.blue
        
        let purpleView = NamedView(tag: 4, frame: CGRect(x: 30.0, y: 320.0, width: 150.0, height: 80.0))
        purpleView.backgroundColor = UIColor.purple
        
        let yellowView = NamedView(tag: 5, frame: CGRect(x: 30.0, y: 14.0, width: 100.0, height: 50.0))
        yellowView.backgroundColor = UIColor.yellow
        
        purpleView.addSubview(yellowView)
        redView.addSubview(greenView)
        redView.addSubview(blueView)
        view.addSubview(redView)
        view.addSubview(purpleView)
        return view
    }

}

