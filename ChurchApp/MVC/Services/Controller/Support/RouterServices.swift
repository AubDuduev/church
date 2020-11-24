//
//  RouterServices.swift
//  ChurchApp
import Foundation

class RouterServices: Controller {
  
  public var VC: ServicesViewController!
  
  public func push(_ type: ServiceType?, service: DECService?){
    
    switch type {
      case .products:
        self.pushBakery()
      case .healthNote:
        self.VC.price     = self.VC.prices.healthNote
        self.VC.orderType = .healthNote
        self.pushNote(service: service)
      case .donate:
        self.pushDonations()
      case .restNote:
        self.VC.price     = self.VC.prices.restNote
        self.VC.orderType = .restNote
        self.pushNote(service: service)
      case .prayerService:
        self.VC.price     = self.VC.prices.prayerService
        self.VC.orderType = .prayerService
        self.pushNote(service: service)
      case .proskomidiya:
        self.VC.price     = self.VC.prices.proskomidiya
        self.VC.orderType = .proskomidiya
        self.pushNote(service: service)
      case .sorokoust:
        self.VC.price     = self.VC.prices.sorokoust
        self.VC.orderType = .sorokoust
        self.pushNote(service: service)
      case .psaltir:
        self.VC.price     = self.VC.prices.psaltir
        self.VC.orderType = .psaltir
        self.pushNote(service: service)
      default: break
    }
  }
  
  enum Push: CaseIterable {
    case Bakery
    case Note
    case Donations
  }
}
//MARK: - Private functions
extension RouterServices {
  
  private func pushBakery(){
    let bakeryVC = self.VC.getVCForID(storyboardID     : .Bakery,
                                      vcID             : .BakeryVC,
                                      transitionStyle  : .crossDissolve,
                                      presentationStyle: .fullScreen) as! BakeryViewController
    self.VC.present(bakeryVC, animated: true)
  }
  private func pushNote(service: DECService?){
    let noteVC = self.VC.getVCForID(storyboardID     : .Note,
                                    vcID             : .NoteVC,
                                    transitionStyle  : .coverVertical,
                                    presentationStyle: .overCurrentContext) as! NoteViewController
    let noteData    = NoteData(service: service, orderType: self.VC.orderType, price: self.VC.price)
    noteVC.noteData = noteData
    self.VC.present(noteVC, animated: true)
  }
  private func pushDonations(){
    let Donations = self.VC.getVCForID(storyboardID     : .Donations,
                                       vcID             : .DonationsVC,
                                       transitionStyle  : .crossDissolve,
                                       presentationStyle: .fullScreen) as! DonationsViewController
    self.VC.present(Donations, animated: true)
  }
}
//MARK: - Initial
extension RouterServices{
  
  //MARK: - Inition
  convenience init(viewController: ServicesViewController) {
    self.init()
    self.VC = viewController
  }
}

