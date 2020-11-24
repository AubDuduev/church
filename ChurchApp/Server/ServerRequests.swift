//
//  ServerRequests.swift
//  DgBetTrip
//
//  Created by Senior Developer on 19.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

class ServerRequests {
  
  //MARK: - Create type request
  public func set(type: RequestType) -> Requestoble? {
    switch type {
      //GETs
      case .GETStartScreen:
        return GETStartScreen()
      case .GETServerUrl:
        return GETServerUrl()
      case .GETUserData:
        return GETUserData()
      case .GETMessages:
        return GETMessages()
      case .GETEarlyMessages:
        return GETEarlyMessages()
      case .GETWorships:
        return GETWorship()
      case .GETChatList:
        return GETChatList()
      case .GETProducts:
        return GETProducts()
      case .GETServices:
        return GETServices()
      case .GETDonations:
        return GETDonations()
      case .GETPrice:
        return GETPrice()
      case .GETOrders:
        return GETOrders()
      case .GETBible:
        return GETBible()
      case .GETBibleText:
        return GETBibleText()
      case .GETPrays:
        return GETPrays()
      case .GETPrayID:
        return GETPrayID()
      //POSTs
      case .POSTRegistration:
        return POSTRegistration()
      case .POSTAwayHits:
        return POSTAwayHits()
      case .POSTPhoto:
        return POSTPhoto()
      case .POSTOrder:
        return POSTOrder()
      case .POSTTransaction:
        return POSTTransaction()
      //PATCHs
      case .PATCHDeeplink:
        return PATCHDeeplink()
      case .PATCHParams:
        return PATCHParams()
      case .PATCHPushToken:
        return PATCHPushToken()
      case .PATHUserData:
        return PATHUserData()
    }
  }
  
  enum RequestType {
    //GET
    case GETDonations
    case GETStartScreen
    case GETServerUrl
    case GETUserData
    case GETMessages
    case GETEarlyMessages
    case GETWorships
    case GETChatList
    case GETProducts
    case GETServices
    case GETPrice
    case GETOrders
    case GETBible
    case GETBibleText
    case GETPrays
    case GETPrayID
    //POST
    case POSTRegistration
    case POSTAwayHits
    case POSTPhoto
    case POSTOrder
    case POSTTransaction
    //PATCH
    case PATCHDeeplink
    case PATCHParams
    case PATCHPushToken
    case PATHUserData
    //DELETE
    //case DELETE
  }
}
