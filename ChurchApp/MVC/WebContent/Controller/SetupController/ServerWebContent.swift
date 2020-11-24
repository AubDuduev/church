//
//  ServerWebContent.swift
//  ChurchApp

import Foundation

class ServerWebContent: Controller {
  
  //MARK: - Public variable
  public var VC: WebContentViewController!
  
  
}
//MARK: - Initial
extension ServerWebContent{
  
  //MARK: - Inition
  convenience init(viewController: WebContentViewController) {
    self.init()
    self.VC = viewController
  }
}

