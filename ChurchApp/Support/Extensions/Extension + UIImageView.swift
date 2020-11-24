//
//  Extension + UIImageView.swift
//  Inters
//
//  Created by DEVELOPER on 19/03/2020.
//  Copyright © 2020 DEVELOPER. All rights reserved.
//

import UIKit

extension UIImageView {
	
	func set(nameImage: NameImage){
		self.image = UIImage(named: nameImage.rawValue)
	}
	func set(string: String?){
    guard let string = string else { return }
    self.image = UIImage(named: string)
  }
	enum NameImage: String {
		
    case circlePageStartNoChange
    case circlePageStarChange
	}
}



