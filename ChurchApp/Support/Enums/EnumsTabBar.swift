//
//  TabBarImages.swift
//  UmmaSPB
//
//  Created by Aleksandr on 16.02.2020.
//  Copyright © 2020 Aleksandr. All rights reserved.
//
import Foundation

enum TabBarImage: String, CaseIterable {
  
  case newsButton
  case servicesButton
  case chatButton
  case worshipButton
  case otherButton
}

enum TabBarText: String, CaseIterable {
  
  case oneTabBar  = "Новости"
  case twoTabBar  = "Услуги"
  case treeTabBar = "Общение"
  case foreTabBar = "Службы"
  case fiveTabBar = "Другое"
	
	private func localizedString() -> String {
			return NSLocalizedString(self.rawValue, comment: "")
	}

	static func getTextFor(title: TabBarText) -> String {
			return title.localizedString()
	}
}
