//
//  SetupPrayers.swift
//  ChurchApp

import Foundation

class SetupPrayers: Controller {
  
  //MARK: - Public variable
  public var VC: PrayersViewController!
  
  public func viewDidLoad() {
    self.prayersTable()
  }
}
//MARK: - Private functions
extension SetupPrayers {
  
  private func prayersTable(){
    self.VC.prayersTable.controllers = self.VC.controllers
  }
}
//MARK: - Initial
extension SetupPrayers{
  
  //MARK: - Inition
  convenience init(viewController: PrayersViewController) {
    self.init()
    self.VC = viewController
  }
}

