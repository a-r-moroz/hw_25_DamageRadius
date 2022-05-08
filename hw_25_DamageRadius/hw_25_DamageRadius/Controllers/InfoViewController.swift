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
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        buttonAppearance.setupButton(self.buttonAppearance)
        viewAppearance.layer.cornerRadius = 25
        viewAppearance.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func viewTapped() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped))
        backgroundImage.isUserInteractionEnabled = true
        backgroundImage.addGestureRecognizer(tap)
    }
    
    @objc func tapped() {
        dismiss(animated: true)
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        
        dismiss(animated: true)
    }
}
