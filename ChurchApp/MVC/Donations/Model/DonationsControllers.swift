//
//  DonationsControllers.swift
//  ChurchApp
//
//  Created by Senior Developer on 27.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class DonationsControllers: Controllers {
  
  let setup    : SetupDonations!
  let server   : ServerDonations!
  let present  : PresentDonations!
  let logic    : LogicDonations!
  let animation: AnimationDonations!
  let router   : RouterDonations!
  let vc       : DonationsViewController!
  
  init(viewController: DonationsViewController) {
    
    self.setup     = SetupDonations(viewController: viewController)
    self.server    = ServerDonations(viewController: viewController)
    self.present   = PresentDonations(viewController: viewController)
    self.logic     = LogicDonations(viewController: viewController)
    self.animation = AnimationDonations(viewController: viewController)
    self.router    = RouterDonations(viewController: viewController)
    self.vc        = viewController
  }
}
