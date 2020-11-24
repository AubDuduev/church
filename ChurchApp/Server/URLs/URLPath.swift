//  Created by Senior Developer on 19.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

class URLPath {
  
  private let currentUserID = GVuserData?.userID ?? "no userd id"
  
  enum Path: String {

    case non          = "/"
    case config
    case startScreen  = "start_screen.json"
    case prodURL      = "prod.json"
    case users
    case token
    case deeplinks
    case params
    case messages
    case chats
    case awayHits      = "away-hits"
    case pushToken     = "push-tokens"
    case allChats      = "all-chats"
    case manuals       = "unread-manuals"
    case payments      = "payments/charge-by-token"
    case pay           = "/pay"
    case question      = "/?"
    case upload        = "upload"
    case returnCash    = "refund-requests"
    case subscriptions
    case verifyReceipt = "/verifyReceipt"
    case services
    case products
    case start
    case orders
    case bible
    case covenants
    case book
    case prays

  }
  enum ChangePath {
    
    case non
    case startScreen
    case serverUrls
    case userID
    case chatID(id: String)
    case lessThanMessages(Path, String?, Path)
    case bookText(BibleTextData)
  }
  
  public func create(change: ChangePath) -> String {
    //create Change Path for url
    switch change {
      //MARK: - Non
      case .non:
        return ""
      case .startScreen:
        let newPath = [Path.config.rawValue, Path.startScreen.rawValue].joined(separator: "/")
        return newPath
      case .serverUrls:
        let newPath = [Path.config.rawValue, Path.prodURL.rawValue].joined(separator: "/")
        return newPath
      case .userID:
        return currentUserID
      case .chatID(id: let id):
        return id
      case .lessThanMessages(let chats, let chatID, let messages):
        guard let ID = chatID else { return "" }
        return ["", chats.rawValue, ID, messages.rawValue].joined(separator: "/")
      case .bookText(let data):
        let bookID    = String(data.bookID    ?? 0)
        let chpaterId = String(data.chpaterID ?? 0)
        let newPath   = [bookID, chpaterId].joined(separator: "/")
        return newPath
    }
  }
}
