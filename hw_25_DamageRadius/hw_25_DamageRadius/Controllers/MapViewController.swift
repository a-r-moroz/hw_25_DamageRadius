//
//  ViewController.swift
//  hw_25_DamageRadius
//
//  Created by Andrew Moroz on 6.05.22.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var buttonAppearance: extensionButton!
    
    var circle1 = GMSCircle()
    var circle2 = GMSCircle()
    var circle3 = GMSCircle()

    var coordinates = CLLocationCoordinate2D()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        buttonAppearance.setupButton(self.buttonAppearance)
        mapView.layer.cornerRadius = 5
        
        mapView.isMyLocationEnabled = true
        mapView.delegate = self
        mapView.isIndoorEnabled = true
    }
    
    private func createMarker(coordinates: CLLocationCoordinate2D) {
        
        let marker = GMSMarker(position: coordinates)
//        marker.title = "Широта: \(coordinates.latitude),\nДолгота:\(coordinates.longitude)"
        marker.snippet = "Широта: \(coordinates.latitude),\nДолгота: \(coordinates.longitude)"
        marker.icon = GMSMarker.markerImage(with: .systemBlue)
//        marker.icon = UIImage(systemName: "star.circle.fill")
        mapView.clear()
        marker.map = mapView
        updateCamera(coordinate: coordinates)
    }
    
    private func updateCamera(coordinate: CLLocationCoordinate2D) {
        
        let camera = GMSCameraPosition(latitude: coordinate.latitude, longitude: coordinate.longitude, zoom: mapView.camera.zoom)
        mapView.animate(to: camera)
    }
    
    private func createRadius(coordinate: CLLocationCoordinate2D, circle: GMSCircle,radius: CLLocationDistance, color: UIColor) {
        
        let circleCenter = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
        circle.position = circleCenter
        circle.fillColor = color.withAlphaComponent(0.2)
        circle.strokeColor = color
        circle.strokeWidth = 3
        circle.radius = radius
        circle.map = mapView
    }

    @IBAction func setParametersAction(_ sender: UIButton) {
        
        guard let preferencesVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: PreferencesViewController.self)) as? PreferencesViewController else { return }
        
//        preferencesVC.saveDataDelegate = self //3
        preferencesVC.saveBomb = {
            guard let power = preferencesVC.bomb.power else { return }
            let r1 = 3.8 * pow(Double(power * 1000), 1 / 3)
            let r2 = 9.6 * pow(Double(power * 1000), 1 / 3)
            let r3 = 56 * pow(Double(power * 1000), 1 / 3)
            
            self.createRadius(coordinate: self.coordinates, circle: self.circle1, radius: r1, color: .systemRed)
            self.createRadius(coordinate: self.coordinates, circle: self.circle2, radius: r2, color: .systemYellow)
            self.createRadius(coordinate: self.coordinates, circle: self.circle3, radius: r3, color: .systemGreen)
            
            let camera = GMSCameraPosition(latitude: self.coordinates.latitude, longitude: self.coordinates.longitude, zoom: 10)
            self.mapView.camera = camera
        }
        preferencesVC.modalTransitionStyle = .coverVertical
        preferencesVC.modalPresentationStyle = .overFullScreen
        self.present(preferencesVC, animated: true)
    }
        
}

extension MapViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        createMarker(coordinates: coordinate)
//        createRadius(coordinate: coordinate, radius: 1000, color: .black)
        coordinates = coordinate
    }
}

//extension MapViewController: Servedable { // 4
//
//    func savePower(data: Bomb) {
//        guard let power = data.power else { return }
//        let r1 = 3.8 * pow(Double(power * 1000), 1 / 3)
//        let r2 = 9.6 * pow(Double(power * 1000), 1 / 3)
//        let r3 = 56 * pow(Double(power * 1000), 1 / 3)
//
//        createRadius(coordinate: coordinates, circle: circle1, radius: r1, color: .systemRed)
//        createRadius(coordinate: coordinates, circle: circle2, radius: r2, color: .systemYellow)
//        createRadius(coordinate: coordinates, circle: circle3, radius: r3, color: .systemGreen)
//
//        let camera = GMSCameraPosition(latitude: coordinates.latitude, longitude: coordinates.longitude, zoom: 10)
//        mapView.camera = camera
//    }
//}
