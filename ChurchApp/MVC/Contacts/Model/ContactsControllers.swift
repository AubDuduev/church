//
//  ContactsControllers.swift
//  ChurchApp
//
//  Created by Senior Developer on 29.09.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class ContactsControllers: Controllers {
  
  let setup    : SetupContacts!
  let server   : ServerContacts!
  let present  : PresentContacts!
  let logic    : LogicContacts!
  let animation: AnimationContacts!
  let router   : RouterContacts!
  let vc       : ContactsViewController!
  
  init(viewController: ContactsViewController) {
    
    self.setup     = SetupContacts(viewController: viewController)
    self.server    = ServerContacts(viewController: viewController)
    self.present   = PresentContacts(viewController: viewController)
    self.logic     = LogicContacts(viewController: viewController)
    self.animation = AnimationContacts(viewController: viewController)
    self.router    = RouterContacts(viewController: viewController)
    self.vc        = viewController
  }
}
