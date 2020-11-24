//
//  RouterBible.swift
//  ChurchApp
import Foundation

class RouterBible: Controller {
  
  //MARK: - Public variable
  public var VC: BibleViewController!
  
  
  public func push(_ type: Push){
    
    switch type {
      case .BibleText(let data):
        self.pushBibleTextVC(data: data)
    }
  }
  
  enum Push {
    case BibleText(BibleTextData)
  }
}
//MARK: - Private functions
extension RouterBible {
  
  private func pushBibleTextVC(data: BibleTextData){
    let bibleTextVC = self.VC.getVCForID(storyboardID     : .BibleText,
                                         vcID             : .BibleTextVC,
                                         transitionStyle  : .crossDissolve,
                                         presentationStyle: .fullScreen) as! BibleTextViewController
    bibleTextVC.bibleTextData = data
    self.VC.present(bibleTextVC, animated: true)
  }
}
//MARK: - Initial
extension RouterBible{
  
  //MARK: - Inition
  convenience init(viewController: BibleViewController) {
    self.init()
    self.VC = viewController
  }
}

