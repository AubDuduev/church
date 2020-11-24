//
//  NetworkCheck.swift
//  DgBetTrip
//
//  Created by Senior Developer on 19.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import UIKit

class OpenURL {
  
 static let shared = OpenURL()
  
  public func openString(urlString: String?){
    guard let string = urlString else { return }
    guard let url = URL(string: string) else { return }
    guard UIApplication.shared.canOpenURL(url) else { return }
    UIApplication.shared.open((url), options: [:], completionHandler: nil)
  }
  public func callPhoneURL(number: PhoneNumbers){
    let urlNumber = "tel://\(number.rawValue)"
    guard let url = URL(string: urlNumber) else { return }
    guard UIApplication.shared.canOpenURL(url) else { return }
    UIApplication.shared.open((url), options: [:], completionHandler: nil)
  }
  public func openStringDecode(urlString: String?){
    guard let string = urlString else { return }
    guard let url = URL(string: string.decodedUrl()) else { return }
    guard UIApplication.shared.canOpenURL(url) else { return }
    UIApplication.shared.open((url), options: [:], completionHandler: nil)
  }
  public func openURLs(urls: URLString.Url){
    guard let url = URL(string: urls.rawValue) else { return }
    guard UIApplication.shared.canOpenURL(url) else { return }
    UIApplication.shared.open((url), options: [:], completionHandler: nil)
  }
  public func openURL(url: URL?){
    guard let url = url else { return }
    guard UIApplication.shared.canOpenURL(url) else { return }
    UIApplication.shared.open((url), options: [:], completionHandler: nil)
  }
  public func openCompare(url: URL?, compareURL: CompareURL){
    if compareURL.rawValue == url?.absoluteString {
      guard let url = url else { return }
      guard UIApplication.shared.canOpenURL(url) else { return }
      UIApplication.shared.open((url), options: [:], completionHandler: nil)
    }
  }
  public func compare(urlString: String?, compareURL: CompareURL) -> Bool {
    guard let urlString = urlString else { return false }
    if compareURL.rawValue == urlString {
      return true
    } else {
      return false
    }
  }
  public func openReplaceURL(url: URL?, getURL: GetURL, postURL: PostURL){
    if getURL.rawValue == url?.absoluteString {
      guard let url = URL(string: postURL.rawValue) else { return }
      guard UIApplication.shared.canOpenURL(url) else { return }
      UIApplication.shared.open((url), options: [:], completionHandler: nil)
    }
  }
  enum CompareURL: String {
    case operTelegramChats = ""
    case succesPay = "https://hrampodkopaiapp.ru/pay/success"
    case failPay   = "https://hrampodkopaiapp.ru/payment/fail"
  }
  enum PostURL: String {
    case operTelegramChats = ""
    
  }
  enum GetURL: String {
    case operTelegramChats = ""
  }
  private init(){}
}
