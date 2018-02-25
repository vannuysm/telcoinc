//
//  MapViewController.swift
//  telcoinc
//
//  Created by Charles Chandler on 2/25/18.
//  Copyright © 2018 SAP. All rights reserved.
//

import UIKit
import MapKit
import SAPFiori
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var mapViewHeightConstraint: NSLayoutConstraint!
    
    private let locationManager = CLLocationManager()
    private var current: CLLocation?
    private let regionRadius: CLLocationDistance = 1000
    
    private let worksites: [Worksite] = [
        Worksite(coordinate: CLLocation(latitude: 41.392789, longitude: 2.167397).coordinate)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.register(WorksiteMarker.self, forAnnotationViewWithReuseIdentifier: "FUIMarkerAnnotationView")
        
        mapViewHeightConstraint.constant = UIScreen.main.bounds.height
        mapView.addAnnotations(worksites)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    private func centerMapOnLocation(location: CLLocation, animated: Bool = true) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: animated)
    }
    
    // MARK: - CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        current = locations.last
        
        guard let current = current else {
            return
        }
        
        centerMapOnLocation(location: current)
    }
    
    // MARK: - MKMapViewDelegate
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var view: MKAnnotationView!
        if let pointAnnotation = annotation as? MKPointAnnotation {
            view = FUIMarkerAnnotationView(annotation: pointAnnotation, reuseIdentifier: "FUIMarkerAnnotationView")
            let annotationImage = FUIIconLibrary.map.marker.job
            (view as! FUIMarkerAnnotationView).glyphImage = annotationImage.withRenderingMode(.alwaysTemplate)
            (view as! FUIMarkerAnnotationView).priorityIcon =  FUIIconLibrary.map.marker.veryHighPriority
        }
        return view
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        mapView.deselectAnnotation(view.annotation, animated: true)
    }
    
}
