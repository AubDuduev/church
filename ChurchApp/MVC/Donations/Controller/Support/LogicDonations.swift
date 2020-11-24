//
//  LogicDonations.swift
//  ChurchApp
import UIKit

class LogicDonations: Controller {
  
  //MARK: - Public variable
  public var VC: DonationsViewController!
  
  public func viewDidLoad() {
    self.commonLogic()
  }
}
//MARK: - Private functions
extension LogicDonations {
  
  private func commonLogic(){
    //1 - Получаем данные доната
    self.VC.controllers.server.getDonations { (donations) in
      //2 - Проверяем на ошибки
      guard self.VC.errorHandlerDonations.check(donations: donations) else { return }
      //3 - Высчитываем данные для презентации
      let procent = self.calculation(donations: donations).procent
      let gradus  = self.calculation(donations: donations).gradus
      //4 - Призентуем данные на контроллере
      self.VC.controllers.present.currentSumProcent(procent: procent)
      self.VC.controllers.animation.animationProgressCircle(gradus: gradus)
      self.VC.controllers.present.currentSum(donations: donations)
      self.VC.controllers.present.descriptionDonates(donations: donations)
    }
  }
  private func calculation(donations: DECDonations?) -> (procent: Int, gradus: CGFloat){
    let procent = ((Int(donations?.currentSum ?? "0") ?? 0) * 100) / (Int(donations?.targetSum ?? "0") ?? 0)
    let gradus = CGFloat((360 / 100) * procent)
    return (procent, gradus)
  }
}
//MARK: - Initial
extension LogicDonations{
  
  //MARK: - Inition
  convenience init(viewController: DonationsViewController) {
    self.init()
    self.VC = viewController
  }
}

