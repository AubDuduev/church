//
//  RouterNote.swift
//  ChurchApp
import Foundation

class RouterNote: Controller {
  
  //MARK: - Public variable
  public var VC: NoteViewController!
  
  public func push(_ type: Push){
    
    switch type {
      case .PayNoteVC(let order):
        self.pushPayNoteVC(order: order)
    }
  }
  
  enum Push {
    case PayNoteVC(ENCOrder)
    
  }
}
//MARK: - Private functions
extension RouterNote {
  
  private func pushPayNoteVC(order: ENCOrder){
    let payNoteVC = self.VC.getVCForID(storyboardID     : .PayNote,
                                       vcID             : .PayNoteVC,
                                       transitionStyle  : .crossDissolve,
                                       presentationStyle: .fullScreen) as! PayNoteViewController
    payNoteVC.noteData = self.VC.noteData
    payNoteVC.order    = order
    self.VC.present(payNoteVC, animated: true)
  }
}
//MARK: - Initial
extension RouterNote{
  
  //MARK: - Inition
  convenience init(viewController: NoteViewController) {
    self.init()
    self.VC = viewController
  }
}

