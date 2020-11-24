//
//  AnimationProfile.swift
//  ChurchApp

import Foundation

class AnimationProfile: Controller {
  
  //MARK: - Public variable
  public var VC: ProfileViewController!
  
  
}
//MARK: - Initial
extension AnimationProfile{
  
  //MARK: - Inition
  convenience init(viewController: ProfileViewController) {
    self.init()
    self.VC = viewController
  }
}

