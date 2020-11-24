//
//  PresentWebContent.swift
//  ChurchApp

import Foundation

class PresentWebContent: Controller {
  
  //MARK: - Public variable
  public var VC: WebContentViewController!
  
  
}
//MARK: - Initial
extension PresentWebContent{
  
  //MARK: - Inition
  convenience init(viewController: WebContentViewController) {
    self.init()
    self.VC = viewController
  }
}

