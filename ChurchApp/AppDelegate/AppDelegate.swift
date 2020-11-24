//
//  AppDelegate.swift
//  ChurchApp
//
//  Created by Senior Developer on 22.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  private let rootVC       = RootVC()
  private let notification = GDSetupNotification()
  
  public var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    self.notification.setup(application: application)
    //Set root controller
    self.rootVC.set(window: self.window)
    return true
  }
}

