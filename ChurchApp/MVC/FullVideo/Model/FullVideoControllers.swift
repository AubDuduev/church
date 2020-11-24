//
//  FullVideo.swift
//  DgBetTrip
//
//  Created by Senior Developer on 04.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

class FullVideoControllers: Controllers {
	
	public let setup    : SetupFullVideo!
	public let server   : ServerFullVideo!
	public let present  : PresentFullVideo!
	public let logic    : LogicFullVideo!
	public let animation: AnimationFullVideo!
	
	init(viewController: FullVideoViewController) {
    
		self.setup     = SetupFullVideo(viewController: viewController)
		self.server    = ServerFullVideo(viewController: viewController)
		self.present   = PresentFullVideo(viewController: viewController)
		self.logic     = LogicFullVideo(viewController: viewController)
		self.animation = AnimationFullVideo(viewController: viewController)
	}
}
