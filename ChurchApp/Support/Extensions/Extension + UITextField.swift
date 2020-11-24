//
//  Extension + UITextField.swift
//  Inters
//
//  Created by DEVELOPER on 19/03/2020.
//  Copyright © 2020 DEVELOPER. All rights reserved.
//

import UIKit

extension UITextField {
	
	func setImageLeft(_ imageName: UIImageView.NameImage){
		let imageView = UIImageView()
		imageView.set(nameImage: imageName)
		self.leftViewMode = .always
		let width  = self.frame.height - 10
		let height = self.frame.height - 10
		self.leftView = UIView(frame: CGRect(x: 2.5, y: 5, width: width, height: height))
		self.leftView?.addSubview(imageView)
		imageView.frame = self.leftView!.frame
		imageView.tintColor = .white
	}
	
	func check() -> Bool {
		if self.text != nil, self.text != "" {
			return true
		}
		return false
	}
  public func compare(field: UITextField) -> Bool {
    if let oneText = self.text, let twoText = field.text, oneText == twoText {
      return true
    } else {
      return false
    }
  }
}

class ChangeTextRect: UITextField {
	
	override func textRect(forBounds bounds: CGRect) -> CGRect {
		return bounds.insetBy(dx: 50, dy: 0)
	}
	override func editingRect(forBounds bounds: CGRect) -> CGRect {
		return self.textRect(forBounds: bounds)
	}
}
