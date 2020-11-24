//
//  Extension + UIAplication.swift
//  DgBetTrip
//
//  Created by Senior Developer on 01.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import UIKit

extension UIApplication {
  
  static func VC(type: Types) -> UIViewController {
    self.presentLog()
    let viewController = UIViewController()
    switch type {
      case .RootVC:
        if let vc = UIApplication.shared.delegate!.window??.rootViewController?.children.last {
          return vc
      }
      case .TabBarVC(let index):
        if let tabBarVC = UIApplication.shared.keyWindow?.rootViewController as? MainTabBarViewController {
          return tabBarVC.children[index]
        }
      case .LastWindowVC:
        if let vc = UIApplication.shared.windows.last?.rootViewController {
          return vc
        }
      case .LastChild:
        if let vc = UIApplication.shared.delegate!.window??.rootViewController?.children.last {
          return vc
        }
    }
    return viewController
  }
  private func choiceVC(){
    
  }
  enum Types {
    case LastWindowVC
    case RootVC
    case TabBarVC(Int)
    case LastChild
  }

  static private func presentLog(){
    print("-------------------------")
    print(UIApplication.shared.keyWindow!.rootViewController! , "Window delegate rootViewController")
    print(UIApplication.shared.keyWindow!.rootViewController! , "KeyWindow rootViewController")
    print(UIApplication.shared.keyWindow! , "keyWindow")
    UIApplication.shared.windows.forEach{ print($0.rootViewController!, "RootViewControllers")}
    print(UIApplication.shared.windows.count, "Count Windows")
    UIApplication.shared.windows.forEach{ print($0, "Windows")}
    print("-------------------------")
  }
}


