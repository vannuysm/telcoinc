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
import SAPOData

class MapViewController: AbstractViewController, MKMapViewDelegate, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource, SearchDelegateDelegate {
    
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var mapViewHeightConstraint: NSLayoutConstraint!
    
    private let locationManager = CLLocationManager()
    private var current: CLLocation?
    private let regionRadius: CLLocationDistance = 10000
    
    private var worksites: [Worksite] = []
    
    private var container: FUIDetailPanelContainer!
    
    private var searchDelegate: SearchDelegate!
    
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
            self.presentedViewController?.dismiss(animated: false, completion: nil)
            self.navigationController?.pushViewController(DetailViewController("500000110"), animated: true)
        }
        
        searchDelegate = SearchDelegate(tableView: container.searchResultsViewController.tableView, searchBar: container.searchResultsViewController.searchBar)
        searchDelegate.delegate = self
        
        container.searchResultsViewController.tableView.dataSource = searchDelegate
        container.searchResultsViewController.tableView.delegate = searchDelegate
        container.searchResultsViewController.searchBar.delegate = searchDelegate
        
        container.searchResultsViewController.tableView.register(FUIObjectTableViewCell.self, forCellReuseIdentifier: FUIObjectTableViewCell.reuseIdentifier)
        
        container.contentViewController.subheadlineText = "Subheadline Text"
        container.contentViewController.tableView.delegate = self
        container.contentViewController.tableView.register(FUIObjectTableViewCell.self, forCellReuseIdentifier: FUIObjectTableViewCell.reuseIdentifier)
        container.contentViewController.tableView.register(FUIMapDetailTagObjectTableViewCell.self, forCellReuseIdentifier: FUIMapDetailTagObjectTableViewCell.reuseIdentifier)
        container.contentViewController.tableView.register(FUIMapDetailButtonTableViewCell.self, forCellReuseIdentifier: FUIMapDetailButtonTableViewCell.reuseIdentifier)
        container.contentViewController.tableView.register(FUIMapDetailActionTableViewCell.self, forCellReuseIdentifier: FUIMapDetailActionTableViewCell.reuseIdentifier)
        container.contentViewController.tableView.estimatedRowHeight = 100
        container.contentViewController.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        container!.presentContainer()
        
        getWorksites()
    }
    
    func getWorksites() {
        let query = DataQuery().filter(SalesOrderHeader.lifeCycleStatus.equal("N"))
        
        guard let headers = try? provider.fetchSalesOrderHeaders(matching: query) else {
            return
        }
        
        worksites = headers.flatMap { Worksite(salesOrderHeader: $0) }
        
        searchDelegate.worksites = worksites

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
        var view: WorksiteMarker!
        if let pointAnnotation = annotation as? Worksite {
            view = WorksiteMarker(annotation: pointAnnotation, reuseIdentifier: "FUIMarkerAnnotationView")
            let annotationImage = FUIIconLibrary.map.marker.job
            view.glyphImage = annotationImage.withRenderingMode(.alwaysTemplate)
            view.priorityIcon =  FUIIconLibrary.map.marker.veryHighPriority
            view.worksite = pointAnnotation
        }
        return view
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let selectedAnnotation = view.annotation
        
        guard let view = view as? WorksiteMarker else {
            return
        }
        
        if let id = view.worksite?.salesOrderHeader.customerID {
            container.contentViewController.headlineText = "ID: \(id)"
        }
        container.contentViewController.subheadlineText = view.worksite?.salesOrderHeader.lifeCycleStatusName
        
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
    
    // MARK: - SearchDelegateDelegate
    
    func didSelect(worksite: Worksite) {
        guard let annotation = mapView.annotations.first(where: { (annotation) -> Bool in
            guard let view = self.mapView.view(for: annotation),
                let worksiteView = view as? WorksiteMarker else {
                return false
            }
            
            return worksiteView.worksite?.salesOrderHeader.customerID == worksite.salesOrderHeader.customerID
        }) else {
            return
        }
        
        view.endEditing(true)
        
        mapView.selectAnnotation(annotation, animated: true)
    }
    
}
