//
//  Extension + WKWebView.swift
//  DgBetTrip
//
//  Created by Senior Developer on 04.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import WebKit

extension WKWebView {
  
  func set(string: String? = nil, urls: URLString.Url? = nil, urlHTML: URLString.HTML? = nil){
    
    guard let url = self.create(string: string, urls: urls, urlHTML: urlHTML) else { return }
    // Cookies configuration
    var urlRequest = URLRequest(url: url)
    if let cookies = HTTPCookieStorage.shared.cookies(for: url) {
        let headers = HTTPCookie.requestHeaderFields(with: cookies)
        for header in headers { urlRequest.addValue(header.value, forHTTPHeaderField: header.key) }
    }
    self.load(urlRequest)
  }
  private func create(string: String? = nil, urls: URLString.Url? = nil, urlHTML: URLString.HTML? = nil) -> URL? {
    
    switch true {
      case string != nil:
        return URL(string: string!)
      case urls    != nil:
        return URL(string: urls!.rawValue)
      case urlHTML != nil:
        return Bundle.main.url(forResource: urlHTML!.rawValue, withExtension: "html")
      default:
        return nil
    }
  }
}
