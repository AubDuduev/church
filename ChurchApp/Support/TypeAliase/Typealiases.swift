//
//  Typealiases.swift
//  DgBetTrip
//
//  Created by Senior Developer on 19.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation
//import FirebaseAuth
//import FirebaseFirestore

//MARK:- RESULTS CLOUSURE
typealias ClousurePictureSession = ((PictureSessionResult) -> Void)
typealias ClousureServerResult   = ((ServerResult) -> Void)
typealias ClousureDecode         = ((DecodeResult) -> Void)
typealias ClousureSession        = ((SessionResult) -> Void)
typealias ClousureSessionData    = ((SessionDataResult) -> Void)
typealias ClousureRequest        = ((RequestResult) -> Void)
typealias ClousureResultFB       = ((FirebaseResult) -> Void)

//MARK: - CLOUSURES
typealias ClousureReturn<T>      = (() -> T)
typealias Clousure<T>            = ((T) -> Void)
typealias ClousureEmpty          = (() -> Void)
typealias ClousureTwo<T, G>      = ((T, G) -> Void)
typealias ClousureAny            = ((Any?) -> Void)

//MARK: - CUSTOM TYPE
typealias Header    = [String: String]
typealias ReturnURL = (string: String?, URL: URL?)
//typealias ReturnFB  = (url: CollectionReference?, doc: DocumentReference?
typealias ChoosePSCellState = (state: Bool, indexPath: IndexPath)
typealias CallBackChoosePS  = (type: ChoosePSData.ChoosePSType, data: [ENCKeyValue])

  
