//
//  RouterProfile.swift
//  ChurchApp
import Foundation

class RouterProfile: Controller {
  
  //MARK: - Public variable
  public var VC: ProfileViewController!
  
  
}
//MARK: - Initial
extension RouterProfile{
  
  //MARK: - Inition
  convenience init(viewController: ProfileViewController) {
    self.init()
    self.VC = viewController
  }
}

