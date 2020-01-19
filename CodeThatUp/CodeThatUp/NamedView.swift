//
//  NamedView.swift
//  CodeThatUp
//
//  Created by Kaan Ersan on 2020-01-19.
//  Copyright © 2020 Kaan. All rights reserved.
//

import Foundation
import UIKit

class NamedView: UIView {
    
    let startingValue = Int(("A" as UnicodeScalar).value) // 65

    lazy var name: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        if let unicodeScalar = UnicodeScalar(self.tag + startingValue) {
            label.text = String(unicodeScalar)
        }
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    init(tag: Int, frame: CGRect) {
        super.init(frame: frame)
        self.tag = tag
        addSubview(name)
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: topAnchor, constant: 10.0),
            name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5.0)
        ])
    }
}

