//
//  RouterMainTabBar.swift
//  ChurchApp
import Foundation

class RouterMainTabBar: Controller {
  
  //MARK: - Public variable
  public var VC: MainTabBarViewController!
  
  
}
//MARK: - Initial
extension RouterMainTabBar {
  
  //MARK: - Inition
  convenience init(viewController: MainTabBarViewController) {
    self.init()
    self.VC = viewController
  }
}

