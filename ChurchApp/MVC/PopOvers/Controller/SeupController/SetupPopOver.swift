//
//  SetupPopOver.swift
//  ChurchApp

import Foundation

class SetupPopOver: Controller {
  
  //MARK: - Public variable
  public var VC: PopOverViewController!
  
  
}
//MARK: - Initial
extension SetupPopOver{
  
  //MARK: - Inition
  convenience init(viewController: PopOverViewController) {
    self.init()
    self.VC = viewController
  }
}

