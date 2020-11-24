//
//  MakeDonationControllers.swift
//  ChurchApp
//
//  Created by Senior Developer on 14.07.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

class MakeDonationControllers: Controllers {
  
  let setup    : SetupMakeDonation!
  let server   : ServerMakeDonation!
  let present  : PresentMakeDonation!
  let logic    : LogicMakeDonation!
  let animation: AnimationMakeDonation!
  let router   : RouterMakeDonation!
  var vc       : UIViewController
  
  init(viewController: MakeDonationViewController) {
    
    self.setup     = SetupMakeDonation(viewController: viewController)
    self.server    = ServerMakeDonation(viewController: viewController)
    self.present   = PresentMakeDonation(viewController: viewController)
    self.logic     = LogicMakeDonation(viewController: viewController)
    self.animation = AnimationMakeDonation(viewController: viewController)
    self.router    = RouterMakeDonation(viewController: viewController)
    self.vc        = viewController
  }
}
