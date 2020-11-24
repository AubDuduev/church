//
//  URLString.swift
//  DgBetTrip
//
//  Created by Senior Developer on 19.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

class URLHost {
  
  enum Host: String {
    case non
    case hramPodCopai = "hrampodkopaiapp.ru"
    case devPay       = "dev.chat.roimaster.site"
    case prodPay      = "dgbet.ru"
    case socketDev    = "ws.dev.chat.roimaster.site"
    case socketProd   = "ws.dgbet.store"
    case verifyProd   = "buy.itunes.apple.com"
    case verifyDev    = "sandbox.itunes.apple.com"
  }
  enum Types {
    case Static(Host)
    case String(String?)
    case Socket
    case non
  }
  public func create(_ type: URLHost.Types) -> String {
    switch type {
      case .Socket:
        let url = URL(string: GVuserData.urlWebSocet ?? "")
        return url?.host ?? "no socket host"
      case .Static(let host):
        return host.rawValue
      case .String(let stringHost):
        return stringHost ?? ""
      case .non:
        return ""
    }
  }
}
