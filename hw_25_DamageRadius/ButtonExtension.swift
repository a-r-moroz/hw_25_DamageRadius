//
//  ButtonExtension.swift
//  hw_25_DamageRadius
//
//  Created by Andrew Moroz on 7.05.22.
//

import Foundation
import UIKit

final class extensionButton: UIButton {
    
    func setupButton(_ button: UIButton) {
        
        button.layer.cornerRadius = 5
        button.layer.shadowColor = UIColor.systemBlue.cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.rasterizationScale = UIScreen.main.scale
    }
}
