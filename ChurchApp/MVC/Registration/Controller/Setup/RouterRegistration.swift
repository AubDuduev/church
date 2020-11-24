//
//  RouterRegistration.swift
//  ChurchApp
import Foundation

class RouterRegistration: Controller {
  
  //MARK: - Public variable
  public var VC: RegistrationViewController!
  
  public func push(_ type: Push){
    switch type {
      case .tabBarVC:
        self.pushTabBarVC()
    }
  }
  
  enum Push {
    case tabBarVC
  }
}
//MARK: - Private functions
extension RouterRegistration {
  
  private func pushTabBarVC(){
    let VC = self.VC.getVCForID(storyboardID     : .MainTabBar,
                                vcID             : .MainTabBarVC,
                                transitionStyle  : .crossDissolve,
                                presentationStyle: .fullScreen) as! MainTabBarViewController
    self.VC.present(VC, animated: true)
  }
}
//MARK: - Initial
extension RouterRegistration{
  
  //MARK: - Inition
  convenience init(viewController: RegistrationViewController) {
    self.init()
    self.VC = viewController
  }
}

