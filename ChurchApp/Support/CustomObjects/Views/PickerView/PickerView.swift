//
//  PickerView.swift
//  ChurchApp
//
//  Created by Senior Developer on 08.11.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

class PickerView: UIView {
  
  private let label      = UILabel()
  private var picker     : UIPickerView!
  private var pickerSize : CGSize!
  private var textSize   : CGFloat!
  private var textLabel  : String!
  private var centerLabel: CGFloat!
  
  
  public func setup(textSize: CGFloat, text: String, centerLabel: CGFloat, heightV: CGFloat){
    self.textSize    = textSize
    self.textLabel   = text
    self.centerLabel = centerLabel
    self.pickerSize  = picker.rowSize(forComponent: 0)
    let width        = self.pickerSize.width  - 0
    let height       = self.pickerSize.height - heightV
    self.center.y    = picker.center.y
    self.center.x    = picker.center.x
    self.frame       = CGRect(x: 0, y: 0, width: width, height: height)
    self.backgroundColor        = .clear
    self.picker.backgroundColor = .clear
    self.picker.cornerRadius(0, true)
    self.label.adjustsFontSizeToFitWidth = true
    setupLabel()
  }
  private func setupLabel(){
    let width : CGFloat   = self.frame.width  - 0
    let height: CGFloat   = self.frame.height - 0
    self.label.frame.size = CGSize(width: width, height: height)
    self.label.center.y   = self.center.y - centerLabel
    self.label.center.x   = self.center.x
    self.label.text       = textLabel
    self.label.textColor  = .black
    self.label.font       = UIFont.set(.rubikMedium, self.textSize)
    label.textAlignment   = .center
    label.backgroundColor = UIColor.set(.buttonYellow)
    label.contentMode     = .top
    self.addSubview(label)
  }
  override init(frame: CGRect) {
    super.init(frame: frame)
    
  }
  convenience init(picker: UIPickerView) {
    self.init()
    self.picker = picker
  }
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
