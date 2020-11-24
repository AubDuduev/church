//
//  LogicTabBar.swift
//  ChurchApp
import UIKit

class LogicMainTabBar: Controller {
  
  //MARK: - Public variable
  public var tabbarVC: MainTabBarViewController!
  
  public func tapButton() {
    self.tabbarVC.tabBarView.actions = { index in
      self.tabbarVC.selectedIndex = index
      self.changesWhenSwitchingTabBar(index: index)
    }
  }
  //MARK: - Create View Controllers For TabBar
  public func createVcForTabBar() -> [UIViewController]{
    let newVC      = UIStoryboard.createVCID(sbID: .News    , vcID: .NewsVC)
    let servicesVC = UIStoryboard.createVCID(sbID: .Services, vcID: .ServicesVC)
    let chatVC     = UIStoryboard.createVCID(sbID: .Chat    , vcID: .ChatVC)
    let worshipVC  = UIStoryboard.createVCID(sbID: .Worship , vcID: .WorshipVC)
    let otherVC    = UIStoryboard.createVCID(sbID: .Other   , vcID: .OtherTVC)
    let controllers = [newVC, servicesVC, chatVC, worshipVC, otherVC]
    return controllers
  }
  public func changesWhenSwitchingTabBar(index: Int){
    self.tabbarVC.controllers.present.navBarData(index: index)
  }
  public func changeSectionTabBarButton(index: Int){
    let button = UIButton()
    button.tag = index
    self.tabbarVC.tabBarView.actionButton(button: button)
    self.tapButton()
    self.tabbarVC.navBarView.chaildVC(index: index)
  }
}
//MARK: - Private functions
extension LogicMainTabBar {
  
 
}
//MARK: - Initial
extension LogicMainTabBar {
  
  //MARK: - Inition
  convenience init(viewController: MainTabBarViewController) {
    self.init()
    self.tabbarVC = viewController
  }
}
