//
//  LogicPayNote.swift
//  ChurchApp
import UIKit

class LogicPayNote: Controller {
  
  //MARK: - Public variable
  public var VC: PayNoteViewController!
  
  public func viewDidLoad() {
    self.set()
    self.setCurrentSumm()
  }
  
  public func daysDonationButtons(button: UIButton?){
    guard let button = button else { return }
    self.VC.daysDonationButtons.forEach { $0.backgroundColor = .white }
    self.VC.daysDonationButtons.forEach { $0.setTitleColor(.set( .makeDonationDaysText), for: .normal) }
    button.backgroundColor = .set(.buttonYellow)
    button.setTitleColor(.black, for: .normal)
    self.VC.recurrentType = RecurrentType.getType(name: button.currentTitle)
    //Умножаем дни на сумму
    self.VC.order = self.changeSummOrder()
    //Отоброжаем сумму в кнопке
    self.VC.controllers.present.payButton()
  }
  public func aboutHealthAboutRepose(button: UIButton){
    self.VC.aboutHealthAboutReposeButtons.forEach { $0.backgroundColor = .white }
    self.VC.aboutHealthAboutReposeButtons.forEach { $0.setTitleColor(.set( .makeDonationDaysText), for: .normal) }
    button.backgroundColor = .set(.buttonYellow)
    button.setTitleColor(.black, for: .normal)
  }
  public func recurrentDonation(button: UIButton){
    GVuserData.isRecurrentDonation.toggle()
    self.VC.controllers.present.recurrentDonation()
  }
  public func newOrder(){
    //проверяем есть ли заказ если нет выходим из экрана
    guard let _ = self.VC.order else {
      self.VC.dismiss(animated: true, completion: nil)
      return
    }
    self.createDataOrder()
    self.createCommentOrder()
    self.createPeriodOrder()
    self.VC.controllers.server.createOrder(order: self.VC.order) { (response) in
      guard self.VC.errorHandler.check(order: response) else { return }
      if GVuserData.tokenCP == nil {
        self.VC.controllers.router.push(.WebContent(response?.link))
        self.VC.order = nil
      } else {
        let transaction = ENCTransaction(orderID: response?.data?.id)
        PaymentTransaction.shared.pay(encTransaction: transaction)
      }
    }
  }
  public func pushChoosePS(button: UIButton){
    let choosePSData = ChoosePSData(type: ChoosePSData.ChoosePSType.allCases[button.tag])
    self.VC.controllers.router.push(.ChoosePS(choosePSData))
  }
  public func createDataChoosePS(returnData: CallBackChoosePS){
  
    switch returnData.type {
      case .Icon:
        self.VC.dataIcons  = returnData.data
      case .Saint:
        self.VC.dataSaints = returnData.data
    }
  }
}
//MARK: - Private functions
extension LogicPayNote {
  
  private func setCurrentSumm(){
    self.VC.currentSumm = self.VC.order.amount
  }
  
  private func set(){
    guard let orderType = self.VC.noteData.orderType else { return }
    
    switch orderType {
      case .healthNote://Записка о здравии
        self.VC.changeDaysView.isHidden    = false
        self.VC.buttonMolebenView.isHidden = true
        self.VC.commentView.isHidden       = true
        self.VC.sorocoustTypeView.isHidden = true
      case .restNote://Записка об упокоении
        self.VC.changeDaysView.isHidden    = false
        self.VC.buttonMolebenView.isHidden = true
        self.VC.commentView.isHidden       = true
        self.VC.sorocoustTypeView.isHidden = true
      case .prayerService://Молебен
        self.VC.changeDaysView.isHidden    = false
        self.VC.buttonMolebenView.isHidden = false
        self.VC.commentView.isHidden       = false
        self.VC.sorocoustTypeView.isHidden = true
      case .proskomidiya://Проскомидрия
        self.VC.changeDaysView.isHidden    = false
        self.VC.buttonMolebenView.isHidden = true
        self.VC.commentView.isHidden       = true
        self.VC.sorocoustTypeView.isHidden = true
      case .sorokoust://Сорокоуст
        self.VC.changeDaysView.isHidden    = true
        self.VC.buttonMolebenView.isHidden = true
        self.VC.commentView.isHidden       = true
        self.VC.sorocoustTypeView.isHidden = false
        self.VC.commonView.borderColor(.white, 1)
      case .psaltir://Псалтир
        self.VC.changeDaysView.isHidden    = false
        self.VC.buttonMolebenView.isHidden = true
        self.VC.commentView.isHidden       = true
        self.VC.sorocoustTypeView.isHidden = true
      default:
        break
    }
  }
  private func changeSummOrder() -> ENCOrder {
    switch self.VC.recurrentType {
      case .OneDay:
        self.VC.order.amount = Float(Int(self.VC.currentSumm))
      case .FortyDays:
        self.VC.order.amount = Float(Int(self.VC.currentSumm * 40))
      case .SixMonths:
        self.VC.order.amount = Float(Int(self.VC.currentSumm * 183))
      case .OneYear:
        self.VC.order.amount = Float(Int(self.VC.currentSumm * 365))
      default:
        break
    }
    return self.VC.order
  }
  private func createDataOrder(){
    if let dataIcons = self.VC.dataIcons, !dataIcons.isEmpty {
      self.VC.order.data?.append(contentsOf: dataIcons)
      self.VC.dataIcons.removeAll()
    }
    if let dataSaints = self.VC.dataSaints, !dataSaints.isEmpty {
      self.VC.order.data?.append(contentsOf: dataSaints)
      self.VC.dataSaints.removeAll()
    }
  }
  private func createCommentOrder(){
    guard let comment = self.VC.commentTextField.text, !comment.isEmpty else { return }
    let index = self.VC.order.data?.firstIndex(where: {$0.key == "Комментарий"})
    if let index = index {
      self.VC.order.data?.remove(at: index)
    }
    let newData = ENCKeyValue(key: "Комментарий", value: comment)
    self.VC.order.data?.append(newData)
  }
  private func createPeriodOrder(){
    
    if GVuserData.isRecurrentDonation {
      guard let orderType = self.VC.noteData.orderType else { return }
      switch orderType {
        case .sorokoust:
          self.VC.order.recurring_period = self.VC.order.recurring_period
        default:
          self.VC.order.recurring_period = self.VC.recurrentType.rawValue
      }
    } else {
      self.VC.order.recurring_period = nil
    }
  }
}
//MARK: - Initial
extension LogicPayNote{
  
  //MARK: - Inition
  convenience init(viewController: PayNoteViewController) {
    self.init()
    self.VC = viewController
  }
}

