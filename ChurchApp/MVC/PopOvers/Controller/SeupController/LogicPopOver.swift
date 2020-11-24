//
//  LogicPopOver.swift
//  ChurchApp

import Foundation

class LogicPopOver: Controller {
  
  //MARK: - Public variable
  public var VC: PopOverViewController!
  
  
}
//MARK: - Initial
extension LogicPopOver{
  
  //MARK: - Inition
  convenience init(viewController: PopOverViewController) {
    self.init()
    self.VC = viewController
  }
}

