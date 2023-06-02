//
//  CustomButton.swift
//  LeboPro
//
//  Created by Nasim Nozirov on 21.05.2023.
//

import UIKit

class CustomButton: UIButton {

    init(
         withTitle title: String,
         textAlignment: NSTextAlignment,
         font: CGFloat
    ) {
        
        let frame = CGRect(x: 0, y: 0, width: 100, height: 200)
        super.init(frame: frame)
        backgroundColor = .black
        layer.cornerRadius = 5
        titleLabel?.textAlignment = textAlignment
        titleLabel?.font = UIFont.systemFont(ofSize: font)
        self.setTitle(title, for: .normal)
        translatesAutoresizingMaskIntoConstraints  = false
        
        
     
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
  
        
    
}
