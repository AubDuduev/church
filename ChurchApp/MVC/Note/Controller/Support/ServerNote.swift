//
//  ServerNote.swift
//  ChurchApp

import Foundation

class ServerNote: Controller {
  
  //MARK: - Public variable
  public var VC: NoteViewController!
  
  
}
//MARK: - Initial
extension ServerNote{
  
  //MARK: - Inition
  convenience init(viewController: NoteViewController) {
    self.init()
    self.VC = viewController
  }
}

