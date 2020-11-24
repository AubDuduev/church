//
//  LogicMakeDonation.swift
//  ChurchApp

import UIKit

class LogicMakeDonation: Controller {
  
  //MARK: - Public variable
  public var VC: MakeDonationViewController!
  
  public func viewWillDisappear() {
    AlertEK.hide()
  }
  
  public func daysDonationButtons(button: UIButton?){
    self.VC.daysDonationButtons.forEach{$0.backgroundColor = .white}
    self.VC.daysDonationButtons.forEach{$0.setTitleColor(.set( .makeDonationDaysText), for: .normal)}
    button?.backgroundColor = .set(.buttonYellow)
    button?.setTitleColor(.black, for: .normal)
    self.VC.requrrentPeriod = RecurrentType.allCases[button?.tag ?? 0]
    
  }
  public func recurrentDonation(button: UIButton){
    GVuserData.isRecurrentDonation.toggle()
    self.VC.controllers.present.recurrentDonation()
    self.VC.controllers.animation.changeDaysView()
    if GVuserData.isRecurrentDonation {
      self.daysDonationButtons(button: self.VC.daysDonationButtons.first!)
    } else {
      self.daysDonationButtons(button: nil)
    }
  }
  public func newOrder(){
    guard self.VC.nameTextField.check() else {
      AlertEK.dеfault(title: .error, message: .emptyField)
      return
    }
    //1 - Создание заказа
    let data = [ENCKeyValue(key: "Имя", value: self.VC.nameTextField.text)]
    let newOrder = ENCOrder(type  : .donation,
                            data  : data,
                            period: self.VC.requrrentPeriod,
                            amount: Float(self.VC.summTextField.text ?? "0.0"))
    //2 - Пост заппрос на заказ
    self.VC.controllers.server.createOrder(order: newOrder) { (response) in
      //3 - Ответ серевера на заказа и получение ссылки для оплаты
      guard self.VC.errorHandler.check(order: response) else { return }
      if GVuserData.tokenCP == nil {
        self.VC.controllers.router.push(.WebContent(response?.link))
      } else {
        let transaction = ENCTransaction(orderID: response?.data?.id)
        PaymentTransaction.shared.pay(encTransaction: transaction)
      }
    }
  }
}
//MARK: - Private functions
extension LogicMakeDonation {
  
}
//MARK: - Initial
extension LogicMakeDonation{
  
  //MARK: - Inition
  convenience init(viewController: MakeDonationViewController) {
    self.init()
    self.VC = viewController
  }
}

