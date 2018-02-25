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

class MapViewController: AbstractViewController, MKMapViewDelegate, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var mapViewHeightConstraint: NSLayoutConstraint!
    
    private let locationManager = CLLocationManager()
    private var current: CLLocation?
    private let regionRadius: CLLocationDistance = 10000
    
    private var worksites: [Worksite] = []
    
    private var container: FUIDetailPanelContainer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.register(WorksiteMarker.self, forAnnotationViewWithReuseIdentifier: "FUIMarkerAnnotationView")
        
        mapViewHeightConstraint.constant = UIScreen.main.bounds.height
        
        container = FUIDetailPanelContainer(parentViewController: self, mapView: mapView)
        container.contentViewController.headlineText = "Headline Text"
        container.contentViewController.didSelectTitleHandler = {
            print("didSelectTitleHandler called!")
        }
        
        container.searchResultsViewController.tableView.dataSource = self
        container.searchResultsViewController.tableView.delegate = self
        container.searchResultsViewController.tableView.register(FUIObjectTableViewCell.self, forCellReuseIdentifier: FUIObjectTableViewCell.reuseIdentifier)
        container.searchResultsViewController.searchBar.delegate = self
        
        container.contentViewController.subheadlineText = "Subheadline Text"
        container.contentViewController.tableView.delegate = self
        container.contentViewController.tableView.register(FUIObjectTableViewCell.self, forCellReuseIdentifier: FUIObjectTableViewCell.reuseIdentifier)
        container.contentViewController.tableView.register(FUIMapDetailTagObjectTableViewCell.self, forCellReuseIdentifier: FUIMapDetailTagObjectTableViewCell.reuseIdentifier)
        container.contentViewController.tableView.register(FUIMapDetailButtonTableViewCell.self, forCellReuseIdentifier: FUIMapDetailButtonTableViewCell.reuseIdentifier)
        container.contentViewController.tableView.register(FUIMapDetailActionTableViewCell.self, forCellReuseIdentifier: FUIMapDetailActionTableViewCell.reuseIdentifier)
        container.contentViewController.tableView.estimatedRowHeight = 100
        container.contentViewController.tableView.rowHeight = UITableViewAutomaticDimension
        
        getWorksites()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        container!.presentContainer()
    }
    
    func getWorksites() {
        guard let headers = try? provider.fetchSalesOrderHeaders() else {
            return
        }
        
        self.worksites = headers.flatMap { Worksite(salesOrderHeader: $0) }
        
        mapView.addAnnotations(worksites)
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
        let selectedAnnotation = view.annotation
        
        container.contentViewController.headlineText = "Test"
        container.contentViewController.subheadlineText = "Subtitle"
        
        DispatchQueue.main.async {
            self.container.pushChildViewController()
        }
        
        for annotation in mapView.annotations {
            if let annotation = annotation as? MKAnnotation, !annotation.isEqual(selectedAnnotation) {
                self.container.contentViewController.tableView.dataSource = self
                self.container.fitToContent()
                DispatchQueue.main.async {
                    self.container.pushChildViewController()
                }
                return
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        let selectedAnnotation = view.annotation
        
        DispatchQueue.main.async {
            if self.mapView.selectedAnnotations.isEmpty {
                self.container.popChildViewController()
            } else {
                self.container.contentViewController.tableView.dataSource = self
                self.container.fitToContent()
                self.container.contentViewController.tableView.reloadData()
            }
        }
    }
    
    // MARK: - UITableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
