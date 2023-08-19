//
//  CustomImage.swift
//  LeboPro
//
//  Created by Nasim Nozirov on 12.06.2023.
//

import UIKit

class CustomImage: UIImageView {

    init(image: UIImage) {
        let frame = CGRect(x: 0, y: 0, width: 200, height: 400)
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    
}
