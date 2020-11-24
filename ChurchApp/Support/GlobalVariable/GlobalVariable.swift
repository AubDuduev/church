//
//  GlobalVariable.swift
//  DgBetTrip
//
//  Created by Senior Developer on 19.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation
import Reachability

internal var GVstoreProject = StoreProject()
internal var GVuserData     : UserData!
internal let reachability   = try? Reachability()
internal var GVPrice        : DECPrice!
internal var GVeditText     = GDEditText(colorBG: .BlackBG, colorText: .Black, font: .Display, fontSize: 16)
