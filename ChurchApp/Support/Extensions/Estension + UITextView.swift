//
//  Estension + UITextView.swift
//  DgBetTrip
//
//  Created by Developer on 26.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//

import UIKit

extension UITextView {
  
  public func checkSendMessage() -> Bool {
    if var textMessage = self.text, !textMessage.isEmpty, textMessage != "Сообщение ..."  {
      textMessage = textMessage.replacingOccurrences(of: "@", with: "")
      self.text = textMessage
      return true
    }
    return false
  }
}
