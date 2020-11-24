//
//  ServerStream.swift
//  ChurchApp

import Foundation

class ServerStream: Controller {
  
  //MARK: - Public variable
  public var VC: StreamViewController!
  
  
}
//MARK: - Initial
extension ServerStream{
  
  //MARK: - Inition
  convenience init(viewController: StreamViewController) {
    self.init()
    self.VC = viewController
  }
}

