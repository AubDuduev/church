//
//  UserData+CoreDataProperties.swift
//  ChurchApp
//
//  Created by Senior Developer on 23.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
//
import Foundation
import CoreData


extension UserData {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<UserData> {
    return NSFetchRequest<UserData>(entityName: "UserData")
  }
  
  @NSManaged public var apiURL: String?
  @NSManaged public var apiURLNotLastSlash: String?
  @NSManaged public var appMetricaDeviceID: String?
  @NSManaged public var appMetricaDeviceToken: String?
  @NSManaged public var appsFlayerConversion: Data?
  @NSManaged public var appsFlayerID: String?
  @NSManaged public var avatarURL: String?
  @NSManaged public var awayURL: String?
  @NSManaged public var currentPromotionAlias: String?
  @NSManaged public var isBlock: Bool
  @NSManaged public var isOrganicInstall: Bool
  @NSManaged public var isPurchaces: Bool
  @NSManaged public var mainVideo: String?
  @NSManaged public var mode: Int16
  @NSManaged public var name: String?
  @NSManaged public var number: String?
  @NSManaged public var policyURL: String?
  @NSManaged public var productActive: Bool
  @NSManaged public var returnCashActive: Bool
  @NSManaged public var secondChanelActive: Bool
  @NSManaged public var secondName: String?
  @NSManaged public var telegrammIsInstall: Bool
  @NSManaged public var tgBot: String?
  @NSManaged public var token: String?
  @NSManaged public var tokenCP: String?
  @NSManaged public var urlStore: String?
  @NSManaged public var urlWebSocet: String?
  @NSManaged public var userID: String?
  @NSManaged public var userLink: String?
  @NSManaged public var webID: String?
  @NSManaged public var isRecurrentDonation: Bool
  
  enum CoreDataKey: String {
    case non
  }
}
