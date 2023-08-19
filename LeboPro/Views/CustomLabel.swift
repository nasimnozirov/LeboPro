//
//  CustomLabel.swift
//  LeboPro
//
//  Created by Nasim Nozirov on 29.05.2023.
//

import UIKit

class CustomLabel: UILabel {
    
    init(backgroundColor: UIColor,textColor: UIColor, title: String, font: UIFont) {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 200)
        super.init(frame: frame)
        
        self.font = font
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        textAlignment = .center
        text = title
        translatesAutoresizingMaskIntoConstraints = false
        numberOfLines = 0
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

