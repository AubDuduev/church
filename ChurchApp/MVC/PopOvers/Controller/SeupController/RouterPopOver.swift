//
//  RouterPopOver.swift
//  ChurchApp
import Foundation

class RouterPopOver: Controller {
  
  //MARK: - Public variable
  public var VC: PopOverViewController!
  
  
}
//MARK: - Initial
extension RouterPopOver{
  
  //MARK: - Inition
  convenience init(viewController: PopOverViewController) {
    self.init()
    self.VC = viewController
  }
}

