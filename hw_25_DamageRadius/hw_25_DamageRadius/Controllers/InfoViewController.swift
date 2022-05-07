//
//  InfoViewController.swift
//  hw_25_DamageRadius
//
//  Created by Andrew Moroz on 7.05.22.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var viewAppearance: UIView!
    
    @IBOutlet weak var buttonAppearance: extensionButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        buttonAppearance.setupButton(self.buttonAppearance)
        viewAppearance.layer.cornerRadius = 25
        viewAppearance.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        
        dismiss(animated: true)
    }
}
