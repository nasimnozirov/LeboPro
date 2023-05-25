//
//  CustomTextField.swift
//  LeboPro
//
//  Created by Nasim Nozirov on 21.05.2023.
//

import UIKit

class CustomTextField: UITextField {

    init(
         placeholder: String,
         isSecureTextEntry: Bool,
         returnKeyType: UIReturnKeyType
    ) {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 200)
        super.init(frame: frame)

        
        self.placeholder = placeholder
        self.isSecureTextEntry = isSecureTextEntry
        self.returnKeyType = returnKeyType
        textColor = .black
        textAlignment = .left
        backgroundColor = .white
        autocorrectionType = .no
        spellCheckingType = .no
        layer.cornerRadius = 5
        enablesReturnKeyAutomatically = true
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
