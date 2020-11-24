//
//  NoteTableCell.swift
//  ChurchApp
import UIKit

class NoteTableCell: UITableViewCell, LoadNidoble {
  
 
  private var controllers: NoteControllers!
  
  public var indexPath: IndexPath!
  
  @IBOutlet weak var peopleTextField: UITextField!
  @IBOutlet weak var textFieldView  : UIView!
  
  public func configure(controllers: NoteControllers?, indexPath: IndexPath){
    self.controllers = controllers
    self.indexPath   = indexPath
    self.peopleTextField.placeholder = "Имя \(indexPath.row + 1)го человека"
  }
  override func layoutSubviews() {
    super.layoutSubviews()
    self.controllers.setup.layoutSubviews(cell: self)
  }
  @IBAction func deleteGesure(gesture: UISwipeGestureRecognizer){
    guard self.indexPath.row != 0 else { return }
    self.controllers.animation.deleteRow(cell: self, gesture: gesture)
  }
  @IBAction func deleteButton(button: UIButton){
    self.controllers.logic.removeName()
  }
}
