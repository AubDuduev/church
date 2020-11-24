//
//  ChapterPicker.swift
//  ChurchApp
//
//  Created by Senior Developer on 08.11.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

class ChapterPicker: NSObject {
  
  public var chapters   : [DECBibleChapters]!
  public var controllers: BibleTextControllers!
  public var pickerView : UIPickerView!
}

//MARK: --- DataSource PickerView
extension ChapterPicker: UIPickerViewDelegate {

  func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
    self.pickerView = pickerView
    return pickerView.frame.height
  }
  func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
    return pickerView.frame.width
  }
  func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
    let pickerView = PickerView(picker: pickerView)
    let text = "\(row + 1)"
    pickerView.setup(textSize: 14, text: text, centerLabel: 0, heightV: 0)
  return pickerView
  }
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    self.controllers?.logic.textBibleTableChapter(chapter: row + 1)
  }
}
//MARK: --- Delegate PickerView
extension ChapterPicker: UIPickerViewDataSource {
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
  return 1
  }
 
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    switch component {
      case 0:
        return self.chapters?.count ?? 0
      default:
        return 0
    }
  }
}


