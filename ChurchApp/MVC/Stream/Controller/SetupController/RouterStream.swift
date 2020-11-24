//
//  RouterStream.swift
//  ChurchApp
import Foundation

class RouterStream: Controller {
  
  //MARK: - Public variable
  public var VC: StreamViewController!
  
  
}
//MARK: - Initial
extension RouterStream{
  
  //MARK: - Inition
  convenience init(viewController: StreamViewController) {
    self.init()
    self.VC = viewController
  }
}

