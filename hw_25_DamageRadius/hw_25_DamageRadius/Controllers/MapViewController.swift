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
    @IBOutlet weak var buttonAppearance: UIButton!
    
    var circle = GMSCircle()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupButton(buttonAppearance)
        mapView.layer.cornerRadius = 5
        
        mapView.isMyLocationEnabled = true
        mapView.delegate = self
        mapView.isIndoorEnabled = true
    }
    
    private func setupButton(_ button: UIButton) {
        
        button.layer.cornerRadius = 5
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.rasterizationScale = UIScreen.main.scale
    }
    
    private func createMarker(coordinates: CLLocationCoordinate2D) {
        
        let marker = GMSMarker(position: coordinates)
        marker.title = "Координаты: \(coordinates.latitude), \(coordinates.longitude)"
        mapView.clear()
        marker.map = mapView
        updateCamera(coordinate: coordinates)
    }
    
    private func updateCamera(coordinate: CLLocationCoordinate2D) {
        
        let camera = GMSCameraPosition(latitude: coordinate.latitude, longitude: coordinate.longitude, zoom: mapView.camera.zoom)
        mapView.animate(to: camera)
    }
    
    private func createRadius(coordinate: CLLocationCoordinate2D, radius: CLLocationDistance) {
        
        let circleCenter = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
        circle.position = circleCenter
//        circle.fillColor = .systemRed
        circle.strokeColor = .systemRed
        circle.strokeWidth = 3
        circle.radius = radius
        circle.map = mapView
    }

    @IBAction func setParametersAction(_ sender: UIButton) {
        
        guard let preferencesVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: PreferencesViewController.self)) as? PreferencesViewController else { return }
        preferencesVC.modalTransitionStyle = .crossDissolve
        preferencesVC.modalPresentationStyle = .overFullScreen
        self.present(preferencesVC, animated: true)
    }
        
}

extension MapViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        createMarker(coordinates: coordinate)
        createRadius(coordinate: coordinate, radius: 1000)
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        
        return true
    }
}
