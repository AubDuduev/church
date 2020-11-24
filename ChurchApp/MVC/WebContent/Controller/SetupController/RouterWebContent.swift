//
//  RouterWebContent.swift
//  ChurchApp
import Foundation

class RouterWebContent: Controller {
  
  //MARK: - Public variable
  public var VC: WebContentViewController!
  
  
}
//MARK: - Initial
extension RouterWebContent{
  
  //MARK: - Inition
  convenience init(viewController: WebContentViewController) {
    self.init()
    self.VC = viewController
  }
}

