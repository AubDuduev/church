//
//  ActionsContactsViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 29.09.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

extension ContactsViewController {
  
  @IBAction func callButton(button: UIButton){
    OpenURL.shared.callPhoneURL(number: .hram)
  }
  @IBAction func instagrammButton(button: UIButton){
    OpenURL.shared.openURLs(urls: .hramInstagramm)
  }
}
