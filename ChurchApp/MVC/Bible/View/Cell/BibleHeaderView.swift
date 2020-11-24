//
//  BibleHeaderView.swift
//  ChurchApp
//
//  Created by Senior Developer on 04.10.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

class BibleHeaderView: UIView {
  
  private var controllers: BibleControllers!

  @IBOutlet weak var storageLabel: UILabel!
  
  public func configure(controllers: BibleControllers?, storage: DECBibleStorage?){
    self.controllers = controllers
    self.storageLabel.text = storage?.name
  }
}
