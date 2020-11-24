//
//  SetupContacts.swift
//  ChurchApp
import MapKit
import Foundation

class SetupContacts: Controller {
  
  //MARK: - Public variable
  public var VC: ContactsViewController!
  
  public func viewDidLoad() {
    self.mapView()
    self.delegates()
  }
}
//MARK: - Private functions
extension SetupContacts {
  
  private func delegates(){
    self.VC.mapView.delegate = self.VC
  }
  private func mapView(){
    let latitude  : CLLocationDegrees  = 55.75303035
    let longitude : CLLocationDegrees  = 37.641515593700774
    let distance  : CLLocationDistance = 1000
    let myLocation = CLLocationCoordinate2DMake(latitude, longitude)
    let region = MKCoordinateRegion(center: myLocation, latitudinalMeters: distance, longitudinalMeters: distance)
    self.VC.mapView.setRegion(region, animated: true)
    let hramPin = MKPointAnnotation()
    hramPin.coordinate = myLocation
    hramPin.title      = "Храм Святителя Николая в Подкопаях"
    hramPin.subtitle   = "Подкопаевский пер 15"
    self.VC.mapView.addAnnotation(hramPin)
    self.VC.mapView.showsCompass = true
  }
}
//MARK: - Initial
extension SetupContacts{
  
  //MARK: - Inition
  convenience init(viewController: ContactsViewController) {
    self.init()
    self.VC = viewController
  }
}

