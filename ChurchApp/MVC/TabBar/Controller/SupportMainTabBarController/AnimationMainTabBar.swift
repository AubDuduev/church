//
//  AnimationMainTabBar.swift
//  ChurchApp

import Foundation

class AnimationMainTabBar: Controller {
  
  //MARK: - Public variable
  public var VC: MainTabBarViewController!
  
  
}
//MARK: - Initial
extension AnimationMainTabBar{
  
  //MARK: - Inition
  convenience init(viewController: MainTabBarViewController) {
    self.init()
    self.VC = viewController
  }
}

