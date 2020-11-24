//
//  ContactsViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 29.09.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import MapKit
import UIKit

class ContactsViewController: UIViewController {
  
  //MARK: - Controllers
  public var controllers: ContactsControllers!
  
  //MARK: - Public variable
  
  
  //MARK: - Outlets
  @IBOutlet weak var mapView: MKMapView!
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setControllers()
    self.controllers.setup.viewDidLoad()
  }
  private func setControllers(){
    self.controllers = ContactsControllers(viewController: self)
  }
}
