//
//  NormalLabel.swift
//  HowFastYouReact
//
//  Created by ukseung.dev on 2023/04/28.
//

import Foundation
import UIKit

class NormalLabel: UILabel {
    let fontManager = FontManager.shared
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupLabel()
    }
    
    func setupLabel() {
        
        self.sizeToFit()
        self.alpha = 0.0
        self.text = "2"
        self.textColor = .white
        self.font = fontManager.getFont(Font.Bold.rawValue).extraLargeFont
    }
}
