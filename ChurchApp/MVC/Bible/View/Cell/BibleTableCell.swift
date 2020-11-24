//
//  BibleTableCell.swift
//  ChurchApp
import UIKit

class BibleTableCell: UITableViewCell, LoadNidoble {
  
  private var controllers: BibleControllers!
  
  @IBOutlet weak var bookLabel: UILabel!
  
  public func configure(controllers: BibleControllers?, book: DECBibleBook?){
    self.controllers = controllers
    self.bookLabel.text = book?.name
  }
  
}
