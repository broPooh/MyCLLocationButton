//
//  ViewController.swift
//  MyCLLocationButton
//
//  Created by bro on 2022/06/29.
//

import CoreLocation
import CoreLocationUI
import UIKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createButton()
    }

    func createButton() {
        let button = CLLocationButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.icon = .arrowFilled
        button.center = view.center
        button.cornerRadius = 12
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }
    
    @objc func didTapButton() {
        manager.startUpdatingHeading()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        self.manager.stopUpdatingLocation()
        print(locations)
        
    }

}

