//
//  PresentServices.swift
//  ChurchApp

import Foundation

class PresentServices: Controller {
  
  //MARK: - Public variable
  public var VC: ServicesViewController!
  
  public func tableData(services: [DECService]?){
    self.VC.servicesTable.services = services
    self.VC.servicesTable.tableView.reloadData()
  }
}
//MARK: - Initial
extension PresentServices{
  
  //MARK: - Inition
  convenience init(viewController: ServicesViewController) {
    self.init()
    self.VC = viewController
  }
}

