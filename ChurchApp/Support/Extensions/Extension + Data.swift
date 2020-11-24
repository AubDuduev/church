//
//  Extension + Data.swift
//  DG.BET
//
//  Created by -=ALEKSANDR=- on 11/August/2019.
//  Copyright © 2019 -=ALEKSANDR=-. All rights reserved.
//
import Foundation

extension Data {
	
  func customEncodableBase64() -> String {
    let jsonString = String(bytes: self, encoding: .utf8)
		if let data = jsonString?.data(using: .utf8) {
			let urlBase64 = data.base64EncodedString()
    return urlBase64
		} else {
			return "Error customEncodableBase64"
		}
  }
  func getTokenID() -> String {
    let tokenParts = self.map { data -> String in
      return String(format: "%02.2hhx", data)
    }
    let token = tokenParts.joined()
    print("Device Token: \(token)")
    return token
  }
}
