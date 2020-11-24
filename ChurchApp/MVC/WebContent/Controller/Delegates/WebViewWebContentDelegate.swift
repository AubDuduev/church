//
//  WebViewWebContentDelegate.swift
//  ChurchApp
//
//  Created by Senior Developer on 20.07.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit
import WebKit

extension WebContentViewController: WKNavigationDelegate, WKUIDelegate {
  
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    
  }
  func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
    
  }
  func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
    
  }
  func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    
  }
  func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
    
    guard let responce = (navigationResponse.response as? HTTPURLResponse) else { return decisionHandler(.allow) }
    if OpenURL.shared.compare(urlString: responce.url?.absoluteString, compareURL: .succesPay) {
      self.dismiss(animated: true)
    }
    if OpenURL.shared.compare(urlString: responce.url?.absoluteString, compareURL: .failPay) {
      self.dismiss(animated: true)
    }
    decisionHandler(.allow)
  }
}
