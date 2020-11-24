//
//  SetupNote.swift
//  ChurchApp
import UIKit

class SetupNote: Controller {
  
  //MARK: - Public variable
  public var VC: NoteViewController!
  
  public func viewDidLoad() {
    self.commonView()
    self.cornerRadiusView()
    self.textFieldsViews()
    self.setupNotification()
    self.noteTable()
    self.createOrderViewAddPeopleView()
  }
}
//MARK: - Private functions
extension SetupNote {
  
  private func noteTable(){
    self.VC.noteTable.controllers = self.VC.controllers
  }
  private func createOrderViewAddPeopleView(){
    self.VC.createOrderView.cornerRadius(5, true)
    self.VC.addPeopleView.cornerRadius(5, true)
  }
  private func delegates(cell: NoteTableCell){
    cell.peopleTextField.delegate = self.VC
  }
  private func commonView(){
    self.VC.commonView.cornerRadius(20, false)
    self.VC.commonView.shadowColor(color: .black, radius: 5)
  }
  private func cornerRadiusView(){
    self.VC.cornerRadiusView.cornerRadius(20, true)
  }
  private func textFieldsViews(){
    self.VC.textFieldsViews.forEach{ $0.cornerRadius(7, true)}
  }
  private func setupNotification(){
    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil)
    {(notification) in
      self.VC.controllers?.animation.animationCommon(notification: notification, show: true)
    }
    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil)
    {(notification) in
      self.VC.controllers?.animation.animationCommon(notification: notification, show: false)
    }
  }
  public func layoutSubviews(cell: NoteTableCell){
    cell.textFieldView.cornerRadius(5, true)
  }
}
//MARK: - Initial
extension SetupNote{
  
  //MARK: - Inition
  convenience init(viewController: NoteViewController) {
    self.init()
    self.VC = viewController
  }
}

