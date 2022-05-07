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
    @IBOutlet weak var currentSliderValue: UILabel!
    
    weak var saveDataDelegate: Servedable? //1
    let bomb = Bomb()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentSliderValue.text = String(format: "%.0f", slider.value)
        buttonAppearance.setupButton(self.buttonAppearance)
        currentSliderValue.layer.masksToBounds = true
        currentSliderValue.layer.cornerRadius = currentSliderValue.frame.height / 2
        viewAppearance.layer.cornerRadius = 25
        viewAppearance.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        
        let sliderValue: String = String(format: "%.0f", sender.value)
        bomb.power = sender.value
        currentSliderValue.text = sliderValue
    }
    
    @IBAction func saveFuelEquivalentAction(_ sender: UIButton) {
        
        saveDataDelegate?.savePower(data: bomb) //2
        dismiss(animated: true)
    }
}
