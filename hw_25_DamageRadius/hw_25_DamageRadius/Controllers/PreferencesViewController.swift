//
//  PreferencesViewController.swift
//  hw_25_DamageRadius
//
//  Created by Andrew Moroz on 6.05.22.
//

import UIKit

class PreferencesViewController: UIViewController {

    @IBOutlet weak var buttonAppearance: extensionButton!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var viewAppearance: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonAppearance.setupButton(self.buttonAppearance)
        viewAppearance.layer.cornerRadius = 25
        viewAppearance.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func saveFuelEquivalentAction(_ sender: UIButton) {
        
        dismiss(animated: true)
    }
}
