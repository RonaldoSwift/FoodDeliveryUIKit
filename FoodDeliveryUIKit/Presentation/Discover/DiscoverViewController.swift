//
//  MapViewController.swift
//  FoodDeliveryUIKit
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 27/10/23.
//

import UIKit
import MapKit

class DiscoverViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var discoverCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        discoverCollectionView.delegate = self
        discoverCollectionView.dataSource = self
        
        setUpViews()
        registerCells()
        setupMapView()
        addExamplePoints()

        // Do any additional setup after loading the view.
    }
    
    private func setUpViews() {
        self.discoverCollectionView.backgroundView?.backgroundColor = UIColor.clear
        self.discoverCollectionView.backgroundColor = UIColor.clear
    }
    
    private func registerCells() {
        let nib = UINib(nibName: String(describing: DiscoverCollectionViewCell.self), bundle: nil)
        discoverCollectionView.register(nib, forCellWithReuseIdentifier: "DiscoverCollectionViewCell")
    }
    
    private func setupMapView() {
        mapView.delegate = self
        mapView.showsUserLocation = false
        
        mapView.register(CustomAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        mapView.register(CustomClusterAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier)
        
        let region = MKCoordinateRegion(
            center: .init(latitude: 35.278259, longitude: -119.5),
            latitudinalMeters: 500000,
            longitudinalMeters: 50000
        )
        mapView.setRegion(region, animated: false)
    }
    
    private func addExamplePoints() {
        // Removing existing annotations before adding new ones
        let oldAnnotations = self.mapView.annotations
        mapView.removeAnnotations(oldAnnotations)
        
        // Generating and adding new annotations to the map
        let points = generateExamplePoints(40)
        mapView.addAnnotations(points)
    }
    
    private func generateExamplePoints(_ pointsCount: Int) -> [CustomAnnotation] {
        var points: [CustomAnnotation] = []
        
        // Generating sample points
        for _ in 0..<pointsCount {
            let latitude = Double.random(in: 34.0 ... 36.0)
            let longitude = Double.random(in: -121.0 ... -119.0)
            let annotation = CustomAnnotation(latitude: latitude, longitude: longitude)
            points.append(annotation)
        }
        
        return points
    }
    
    private func generateExamplePoints1(_ pointsCount: Int) -> [CustomAnnotation] {
        var points: [CustomAnnotation] = []
        
        // Generating sample points
        for _ in 0..<pointsCount {
            let latitude = Double.random(in: 34.0 ... 36.0)
            let longitude = Double.random(in: -121.0 ... -119.0)
            let annotation = CustomAnnotation(latitude: latitude, longitude: longitude)
            points.append(annotation)
        }
        
        return points
    }
}
