//
//  RouterLoading.swift
//  ChurchApp
import UIKit

class RouterLoading: Controller {
  
  //MARK: - Public variable
  public var VC: LoadingViewController!
  
  public func push(_ type: Push){
    switch type {
      case .tabBarVC:
        self.pushTabBarVC()
      case .startVC:
        self.pushStartVC()
    }
  }
  
  enum Push {
    case tabBarVC
    case startVC
  }
}
//MARK: - Private functions
extension RouterLoading {
  
  private func pushTabBarVC(){
    let tabBarVC = self.VC.getVCForID(storyboardID     : .MainTabBar,
                                      vcID             : .MainTabBarVC,
                                      transitionStyle  : .crossDissolve,
                                      presentationStyle: .fullScreen) as! MainTabBarViewController
    UIApplication.shared.delegate?.window!!.rootViewController = tabBarVC
    UIApplication.shared.delegate?.window!!.makeKey()
    self.VC.present(tabBarVC, animated: true)
  }
  private func pushStartVC(){
    let startVC = self.VC.getVCForID(storyboardID     : .Start,
                                     vcID             : .StartVC,
                                     transitionStyle  : .crossDissolve,
                                     presentationStyle: .fullScreen) as! StartViewController
    self.VC.present(startVC, animated: true)
  }
}
//MARK: - Initial
extension RouterLoading{
  
  //MARK: - Inition
  convenience init(viewController: LoadingViewController) {
    self.init()
    self.VC = viewController
  }
}

