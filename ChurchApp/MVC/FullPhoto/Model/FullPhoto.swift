//
//  FullPhoto.swift
//  DgBetTrip
//
//  Created by Senior Developer on 29.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

class FullPhotoControllers: Controllers {
	
	public let setup    : SetupFullPhoto!
	public let server   : ServerFullPhoto!
	public let present  : PresentFullPhoto!
	public let logic    : LogicFullPhoto!
	public let animation: AnimationFullPhoto!
	
	init(viewController: FullPhotoViewController) {
		self.setup     = SetupFullPhoto(viewController: viewController)
		self.server    = ServerFullPhoto(viewController: viewController)
		self.present   = PresentFullPhoto(viewController: viewController)
		self.logic     = LogicFullPhoto(viewController: viewController)
		self.animation = AnimationFullPhoto(viewController: viewController)
	}
}
