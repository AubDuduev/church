//  Created by Senior Developer on 26.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//

import Foundation

struct DECChat {
  
  let id                 : Int?
  let title              : String?
  let alias              : String?
  let description        : String?
  let type               : String?
  let image              : String?
  let lastMessageTime    : Double?
  let messagesCount      : Int?
  let subscribersCount   : Int?
  let chatAccess         : Bool?
  let pinnedMessage      : DECPinnedMessage?
  let lastMessage        : DECLastMessage?
  let unreadMessagesCount: Int?
  
  enum CodingKeys: String, CodingKey {
    
    case id                  = "id"
    case title               = "title"
    case alias               = "alias"
    case description         = "description"
    case type                = "type"
    case image               = "image"
    case lastMessageTime     = "last_message_at"
    case messagesCount       = "messages_count"
    case subscribersCount    = "subscribers_count"
    case chatAccess          = "have_access"
    case pinnedMessage       = "fixed_message"
    case lastMessage         = "last_message"
    case unreadMessagesCount = "unread_messages_count"
  }
}

extension DECChat: Decodable {
  
  init(from decoder: Decoder) throws {
    
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    self.id                  = try? values.decode(Int?.self            , forKey: .id                 )
    self.title               = try? values.decode(String?.self         , forKey: .title              )
    self.alias               = try? values.decode(String?.self         , forKey: .alias              )
    self.description         = try? values.decode(String?.self         , forKey: .description        )
    self.type                = try? values.decode(String?.self         , forKey: .type               )
    self.image               = try? values.decode(String?.self         , forKey: .image              )
    self.lastMessageTime     = try? values.decode(Double?.self         , forKey: .lastMessageTime    )
    self.messagesCount       = try? values.decode(Int?.self            , forKey: .messagesCount      )
    self.subscribersCount    = try? values.decode(Int?.self            , forKey: .subscribersCount   )
    self.chatAccess          = try? values.decode(Bool?.self           , forKey: .chatAccess         )
    self.pinnedMessage       = try? values.decode(DECPinnedMessage?.self, forKey: .pinnedMessage      )
    self.lastMessage         = try? values.decode(DECLastMessage?.self  , forKey: .lastMessage        )
    self.unreadMessagesCount = try? values.decode(Int?.self             , forKey: .unreadMessagesCount)
  }
}
