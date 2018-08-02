//
//  MapViewController.swift
//  XMedic
//
//  Created by Brand on 20/11/1439 AH.
//  Copyright © 1439 Brand. All rights reserved.
//

import UIKit
import GoogleMaps
import EasyPeasy
import Fakery

class MapViewController: UIViewController {
    
    
    let btn = UIButton()
    let back = UIButton()
    let nav = UIView()
    let footer = UIView()
    let text = UILabel()
    let Title = UILabel()
    
    let fake = Faker()
    
    let A = 21.4224779
    let B = 39.8273719


    @objc func buttonAction(sender: UIButton!) {            
        if let url = NSURL(string: "https://www.google.com/maps/?q=\(A),\(B)"){
            UIApplication.shared.openURL(url as URL)
        }
    }
    @objc func buttonBack(sender: UIButton!) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Start Map
        let camera = GMSCameraPosition.camera(withLatitude: A , longitude: B , zoom: 18.0)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        self.view = mapView
        let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: A , longitude: B ))
        marker.map = mapView
        // End Map
        
        
        view.addSubview(nav)
        // Start Nav
        nav.backgroundColor = UIColor(red:0.98, green:0.98, blue:0.98, alpha:1.0)
        nav.addSubview(back)
        nav.addSubview(Title)
        nav.easy.layout(Top(0.0),Left(0.0),Right(0.0),Size(CGSize(width: UIScreen.main.bounds.size.width, height: 70)))
        let shadowcolor = UIColor(red:0.85, green:0.89, blue:0.91, alpha:1)
        nav.layer.shadowColor = shadowcolor.cgColor
        nav.layer.shadowOpacity = 1
        nav.layer.shadowOffset = CGSize.zero
        nav.layer.shadowRadius = 10
        
        // Start Title
        Title.text = "XMedic"
        Title.textColor = UIColor(red:0.32, green:0.32, blue:0.32, alpha:1.0)
        Title.textAlignment = .center
        Title.font = UIFont(name: "System", size: 25)
        Title.easy.layout(CenterX(0.0),Top(20),Width(60),Height(50.0))
        // End Title
        
        // Start Button Back
        back.setTitle("<", for: .normal)
        back.setTitleColor(UIColor(red:0.32, green:0.32, blue:0.32, alpha:1.0), for: .normal)
        back.addTarget(self, action: #selector(buttonBack), for: .touchUpInside)
        back.easy.layout(Left(16),Top(22),Bottom(19))
        back.layer.cornerRadius = back.bounds.size.height
        // End Button Back
        
        // End Nav

        
        view.addSubview(footer)
        
        // Start footer
        footer.easy.layout(Bottom(0),Left(0.0),Right(0.0),Size(CGSize(width: UIScreen.main.bounds.size.width, height: 200)))
        footer.backgroundColor = UIColor(red:0.98, green:0.98, blue:0.98, alpha:1.0)
        footer.layer.shadowColor = shadowcolor.cgColor
        footer.layer.shadowOpacity = 1
        footer.layer.shadowOffset = CGSize.zero
        footer.layer.shadowRadius = 10
        footer.addSubview(text)
        footer.addSubview(btn)
        
        
        // Start Text
        text.text = fake.lorem.paragraph(sentencesAmount: 6)
        text.numberOfLines = 0
        text.textColor = .gray
        text.textAlignment = .justified
        text.font = UIFont(name: "System", size: 4)
        text.easy.layout(Top(20.0),CenterX(0.0),Bottom(12.0).to(btn),Size(CGSize(width: UIScreen.main.bounds.size.width - 60, height: 150.0)))
        // End Text
        
        
        // Start Button Open Google Map
        btn.setTitle("فتح في الخرائط", for: .normal)
        btn.backgroundColor = UIColor(red:0.47, green:0.52, blue:0.95, alpha:1.0)
        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        btn.easy.layout(Bottom(20.0),CenterX(0.0),Size(CGSize(width: UIScreen.main.bounds.size.width - 40, height: 50.0)))
        // End Button
        
        // End footer
        
        

        
    }

}
