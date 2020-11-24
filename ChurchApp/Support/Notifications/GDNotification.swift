//
//  GDNotification.swift
//  Games
//
//  Created by Developer on 24.05.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

class GDSetupNotification: NSObject {
  
  private var notificationCenter  = UNUserNotificationCenter.current()
  private var remoteNotifications : GDRemoteNotifications!
  
  //MARK: - Setup
  public func setup(application: UIApplication){
    self.remoteNotifications = GDRemoteNotifications(notification: self)
    //delegates
    self.subscribeDelegates()
    //rerquest user
    self.requestUser(application: application)
  }
  private func subscribeDelegates(){
    UNUserNotificationCenter.current().delegate = remoteNotifications
  }
  //MARK: - Request user notifications used
  private func requestUser(application: UIApplication){
    if #available(iOS 10.0, *) {
      let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
      UNUserNotificationCenter.current().requestAuthorization( options: authOptions, completionHandler: {_, _ in })
    } else {
      let settings: UIUserNotificationSettings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
      application.registerUserNotificationSettings(settings)
    }
  application.registerForRemoteNotifications()
  }
  //Создание кастомного уведомления
  public func createNotification(userInfo: [AnyHashable : Any]){
    removeNotification()
    let date        = Date(timeIntervalSinceNow: 5)
    let calendar    = Calendar(identifier: .gregorian)
    let components = calendar.dateComponents([.hour, .minute, .second], from: date)
    let content    = UNMutableNotificationContent()
    let trigger    = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
    
    content.title = userInfo["title"]   as? String ?? "title"
    content.body   = userInfo["message"] as? String ?? userInfo["body"] as? String ?? "body"
    content.sound = UNNotificationSound.default
    let request   = UNNotificationRequest(identifier: "", content: content, trigger: trigger)
    let center    = UNUserNotificationCenter.current()
    center.add(request)
  }
  //удаление уведомлений
  private func removeNotification(){
    let center = UNUserNotificationCenter.current()
    center.removePendingNotificationRequests(withIdentifiers: [""])
  }
}
