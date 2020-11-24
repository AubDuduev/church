//
//  SetupServices.swift
//  ChurchApp

import Foundation

class SetupServices: Controller {
  
  //MARK: - Public variable
  public var VC: ServicesViewController!
  
  public func viewDidLoad() {
    self.servicesTable()
  }
}
//MARK: - Private functions
extension SetupServices {
  
  public func servicesTable(){
    self.VC.servicesTable.controllers = self.VC.controllers
  }
}
//MARK: - Initial
extension SetupServices{
  
  //MARK: - Inition
  convenience init(viewController: ServicesViewController) {
    self.init()
    self.VC = viewController
  }
}

