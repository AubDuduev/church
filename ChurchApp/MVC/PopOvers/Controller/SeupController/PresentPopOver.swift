//
//  PresentPopOver.swift
//  ChurchApp

import Foundation

class PresentPopOver: Controller {
  
  //MARK: - Public variable
  public var VC: PopOverViewController!
  
  
}
//MARK: - Initial
extension PresentPopOver{
  
  //MARK: - Inition
  convenience init(viewController: PopOverViewController) {
    self.init()
    self.VC = viewController
  }
}

