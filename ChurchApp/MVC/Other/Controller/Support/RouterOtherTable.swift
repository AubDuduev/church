//
//  RouterOtherTable.swift
//  ChurchApp
import Foundation

class RouterOtherTable: Controller {
  
  //MARK: - Public variable
  public var VC: OtherTableViewController!
  
  public func push(_ type: Push){
    
    switch type {
      case .Profile:
        self.profileVC()
      case .Orders:
        self.ordersVC()
      case .Abaut:
        self.aboutVC()
      case .Start:
        self.startVC()
      case .Contacts:
        self.contactsVC()
      case .Bible:
        self.bibleVC()
      case .Prayers:
        self.pushPrayersVC()
    }
  }
  
  enum Push {
    
    case Profile
    case Orders
    case Abaut
    case Start
    case Contacts
    case Bible
    case Prayers
  }
}
//MARK: - Private functions
extension RouterOtherTable {
  
  private func profileVC(){
    let VC = self.VC.getVCForID(storyboardID     : .Profile,
                                vcID             : .ProfileVC,
                                transitionStyle  : .crossDissolve,
                                presentationStyle: .fullScreen) as! ProfileViewController
    self.VC.present(VC, animated: true)
  }
  private func bibleVC(){
    let bibleVC = self.VC.getVCForID(storyboardID     : .Bible,
                                     vcID             : .BibleVC,
                                     transitionStyle  : .crossDissolve,
                                     presentationStyle: .fullScreen) as! BibleViewController
    self.VC.present(bibleVC, animated: true)
  }
  private func pushPrayersVC(){
    let prayersVC = self.VC.getVCForID(storyboardID     : .Prayers,
                                       vcID             : .PrayersVC,
                                       transitionStyle  : .crossDissolve,
                                       presentationStyle: .fullScreen) as! PrayersViewController
    self.VC.present(prayersVC, animated: true)
  }
  private func ordersVC(){
    let ordersVC = self.VC.getVCForID(storyboardID     : .Orders,
                                      vcID             : .OrdersVC,
                                      transitionStyle  : .coverVertical,
                                      presentationStyle: .formSheet) as! OrdersViewController
    self.VC.present(ordersVC, animated: true)
  }
  private func aboutVC(){
    let aboutVC = self.VC.getVCForID(storyboardID     : .Abaut,
                                     vcID             : .AbautVC,
                                     transitionStyle  : .coverVertical,
                                     presentationStyle: .formSheet) as! AbautViewController
    self.VC.present(aboutVC, animated: true)
  }
  private func startVC(){
    let startVC = self.VC.getVCForID(storyboardID     : .Start,
                                     vcID             : .StartVC,
                                     transitionStyle  : .coverVertical,
                                     presentationStyle: .formSheet) as! StartViewController
    startVC.viewParent = .OtherVC
    self.VC.present(startVC, animated: true)
  }
  private func contactsVC(){
    let contactsVC = self.VC.getVCForID(storyboardID     : .Contacts,
                                        vcID             : .ContactsVC,
                                        transitionStyle  : .coverVertical,
                                        presentationStyle: .formSheet) as! ContactsViewController
    self.VC.present(contactsVC, animated: true)
  }
}
//MARK: - Initial
extension RouterOtherTable{
  
  //MARK: - Inition
  convenience init(viewController: OtherTableViewController) {
    self.init()
    self.VC = viewController
  }
}

