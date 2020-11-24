//
//  GDRemoteNotification.swift
//  Games
//
//  Created by Developer on 24.05.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import Foundation
import UserNotifications

@available(iOS 10, *)
class GDRemoteNotifications: NSObject, UNUserNotificationCenterDelegate {
 
  private let notification: GDSetupNotification!
  
  // Receive displayed notifications for iOS 10 devices.
  func userNotificationCenter(_ center: UNUserNotificationCenter,  willPresent notification: UNNotification,  withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    let userInfo = notification.request.content.userInfo
    //create notify
    self.notification.createNotification(userInfo: userInfo)
    
  completionHandler(.alert)
  }
  func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?) {
    
  }
  func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
    let userInfo = response.notification.request.content.userInfo
    //create notify
    self.notification.createNotification(userInfo: userInfo)
    
  completionHandler()
  }
  
  init(notification: GDSetupNotification) {
    self.notification = notification
  }
}
