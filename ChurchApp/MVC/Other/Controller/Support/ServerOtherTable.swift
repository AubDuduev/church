//
//  ServerOtherTable.swift
//  ChurchApp

import Foundation

class ServerOtherTable: Controller {
  
  //MARK: - Public variable
  public var VC: OtherTableViewController!
  
  
}
//MARK: - Initial
extension ServerOtherTable{
  
  //MARK: - Inition
  convenience init(viewController: OtherTableViewController) {
    self.init()
    self.VC = viewController
  }
}

