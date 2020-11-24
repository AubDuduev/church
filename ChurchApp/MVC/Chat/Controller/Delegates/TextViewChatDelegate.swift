//
//  TextViewChatDelegate.swift
//  ChurchApp
//
//  Created by Senior Developer on 24.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

extension ChatViewController: UITextViewDelegate {
  
  func textViewDidChange(_ textView: UITextView) {
    self.controllers.logic.heighSendMesageView()
  }
  func textViewDidBeginEditing(_ textView: UITextView) {
    textView.text = ""
  }
}
