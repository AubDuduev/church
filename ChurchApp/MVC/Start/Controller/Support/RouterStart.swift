//
//  RouterStart.swift
//  ChurchApp
import Foundation

class RouterStart: Controller {
  
  //MARK: - Public variable
  public var VC: StartViewController!
  
  public func push(_ type: Push){
    switch type {
      case .tabBarVC:
        self.pushTabBarVC()
      case .registrationVC:
        self.pushRegistrationVC()
    }
  }
  
  enum Push {
    case tabBarVC
    case registrationVC
  }
}
//MARK: - Private functions
extension RouterStart {
  
  private func pushTabBarVC(){
    let VC = self.VC.getVCForID(storyboardID     : .MainTabBar,
                                vcID             : .MainTabBarVC,
                                transitionStyle  : .crossDissolve,
                                presentationStyle: .fullScreen) as! MainTabBarViewController
    self.VC.present(VC, animated: true)
  }
  private func pushRegistrationVC(){
    let VC = self.VC.getVCForID(storyboardID     : .Registration,
                                vcID             : .RegistrationVC,
                                transitionStyle  : .crossDissolve,
                                presentationStyle: .fullScreen) as! RegistrationViewController
    self.VC.present(VC, animated: true)
  }
}
//MARK: - Initial
extension RouterStart{
  
  //MARK: - Inition
  convenience init(viewController: StartViewController) {
    self.init()
    self.VC = viewController
  }
}

