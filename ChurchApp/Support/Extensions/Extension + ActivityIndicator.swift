//
//  Extension + ActivityIndicator.swift
//  Zanjabil
//
//  Created by Aleksandr on 08.03.2020.
//  Copyright © 2020 Aleksandr. All rights reserved.
//
import UIKit

extension UIActivityIndicatorView {
	
	func show(_ activity: Bool){
		if activity {
			self.startAnimating()
			self.isHidden = false
		} else {
			self.stopAnimating()
			self.isHidden = true
		}
	}
}
