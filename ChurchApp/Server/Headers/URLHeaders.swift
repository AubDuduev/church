//
//  URLHeaders.swift
//  DgBetTrip
//
//  Created by Senior Developer on 19.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

class URLHeaders {
	
	private var keyValueHeader = [HeaderKey: HeaderValue]()
	private var keyHeader      = [HeaderKey: String]()
  private let token          = GVuserData?.token ?? "no token"
	
	enum HeaderType {
		
		case appUrlEnc
		case appJson
		case jsonEnc
		case autorization
		case autorization_appJson
		case autorization_appUrlEnc
    case uploadPhoto
	}
	enum HeaderKey: String {
		
		case Authorization
		case contentType = "Content-Type"
    case filename
	}
	enum HeaderValue: String {
		
		case appUrlEnc = "application/x-www-form-urlencoded"
		case appJson   = "application/json"
		case jsonEnc   = "application/x-www-form-urlencoded|application/json"
    case filename  = ".jpeg"
	}
	public func create(type: HeaderType) -> Header {
		switch type {
			//MARK: - AppJson
			case .appJson:
				self.keyValueHeader = [.contentType: .appJson]
				return self.headerKeyValue(dictionary: keyValueHeader)
			//MARK: - AppUrlEnc
			case .appUrlEnc:
				self.keyValueHeader = [.contentType: .appUrlEnc]
				return self.headerKeyValue(dictionary: keyValueHeader)
			//MARK: - JsonEnc
			case .jsonEnc:
				self.keyValueHeader = [.contentType: .jsonEnc]
				return self.headerKeyValue(dictionary: keyValueHeader)
      //MARK: - Autorization
      case .uploadPhoto:
        self.keyHeader = [.Authorization: self.token, .filename: UUID().uuidString + HeaderValue.filename.rawValue]
        return self.headerKey(dictionary: self.keyHeader)
			//MARK: - Autorization
			case .autorization:
				self.keyHeader = [.Authorization: self.token]
				return self.headerKey(dictionary: self.keyHeader)
			//MARK: - Autorization_appJson
			case .autorization_appJson:
				self.keyHeader = [.Authorization: self.token, .contentType: HeaderValue.appJson.rawValue]
				return self.headerKey(dictionary: self.keyHeader)
			//MARK: - Autorization_appUrlEnc
			case .autorization_appUrlEnc:
				self.keyHeader = [.Authorization: self.token, .contentType: HeaderValue.appUrlEnc.rawValue]
				return self.headerKey(dictionary: self.keyHeader)
		}
	}
	
	//MARK: - Private functions
	private func headerKey(dictionary: [HeaderKey: String]) -> Header {
		let key   = dictionary.map { $0.key.rawValue}
		let value = dictionary.map { $0.value}
		let header = Header(uniqueKeysWithValues: zip(key, value))
		return header
	}
	//MARK: - Private functions
	private func headerKeyValue(dictionary: [HeaderKey: HeaderValue]) -> Header {
		let key   = dictionary.map { $0.key.rawValue}
		let value = dictionary.map { $0.value.rawValue}
		let header = Header(uniqueKeysWithValues: zip(key, value))
		return header
	}
}

