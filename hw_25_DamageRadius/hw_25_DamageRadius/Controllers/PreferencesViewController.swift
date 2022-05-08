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
    @IBOutlet weak var backgroundImage: UIImageView!
    
//    weak var saveDataDelegate: Servedable? //1
    var bomb = Bomb()
    var saveBomb: (() -> ())?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        currentSliderValue.text = String(format: "%.0f", slider.value)
        buttonAppearance.setupButton(self.buttonAppearance)
        currentSliderValue.layer.masksToBounds = true
        currentSliderValue.layer.cornerRadius = currentSliderValue.frame.height / 2
        viewAppearance.layer.cornerRadius = 25
        viewAppearance.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        bomb.power = 10000
    }
    
    func viewTapped() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped))
        backgroundImage.isUserInteractionEnabled = true
        backgroundImage.addGestureRecognizer(tap)
    }
    
    @objc func tapped() {
        dismiss(animated: true)
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        
        let sliderValue: String = String(format: "%.0f", sender.value)
        bomb.power = sender.value
        currentSliderValue.text = sliderValue
    }
    
    @IBAction func infoButtonAction(_ sender: UIButton) {
        
//        present(sender.addInfoAlert(), animated: true)
        guard let infoVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: InfoViewController.self)) as? InfoViewController else { return }
        
        infoVC.modalTransitionStyle = .coverVertical
        infoVC.modalPresentationStyle = .overFullScreen
        self.present(infoVC, animated: true)
    }
    
    @IBAction func saveFuelEquivalentAction(_ sender: UIButton) {
        
//        saveDataDelegate?.savePower(data: bomb) //2
        saveBomb?()
        dismiss(animated: true)
    }
}
