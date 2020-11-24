//
//  PresentMainTabBar.swift
//  ChurchApp

import Foundation

class PresentMainTabBar: Controller {
  
  //MARK: - Public variable
  public var VC: MainTabBarViewController!
  
  
  public func navBarData(index: Int){
    self.VC.navBarView.setUserData(index: index)
  }
}
//MARK: - Initial
extension PresentMainTabBar{
  
  //MARK: - Inition
  convenience init(viewController: MainTabBarViewController) {
    self.init()
    self.VC = viewController
  }
}

