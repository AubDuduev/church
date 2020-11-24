//
//  StoreProject.swift
//  DgBetTrip
//
//  Created by Senior Developer on 19.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

class StoreProject: NSObject {
  
  static let shared = StoreProject()
  
  private let standard = UserDefaults.standard
  
  public func save(key: StoreProjectKey.Key, value: Any?){
		if let value = value {
			standard.set(value, forKey: key.rawValue)
		} else {
			standard.set("", forKey: key.rawValue)
		}
	}
	
  public func get(key: StoreProjectKey.Key) -> Any {
		if let value = standard.object(forKey: key.rawValue) {
			return value
		} else {
			return false
		}
	}
  public func getBool(key: StoreProjectKey.Key = StoreProjectKey.Key.nul, keys: StoreProjectKey.Keys = .nul, keyString: String? = nil) -> Bool {
		if let string = keyString {
			return standard.bool(forKey: string)
		} else if key != .nul {
			return standard.bool(forKey: key.rawValue)
		} else {
			switch keys {
				case .likesAndDislike(let oneParam, let twoParam):
					let key = oneParam.rawValue + (twoParam ?? "")
					return standard.bool(forKey: key)
        case .likesAndDislikeInfoButton(let oneParam, let twoParam):
          let key = oneParam.rawValue + (twoParam ?? "")
          return standard.bool(forKey: key)
				case .isOrder(let oneParam, let twoParam):
					let key = oneParam.rawValue + (twoParam ?? "")
					return standard.bool(forKey: key)
				case .nul:
					return false
			}
		}
	}
  public func saveBool(key: StoreProjectKey.Key = .nul, keys: StoreProjectKey.Keys = .nul, keyString: String? = nil, value: Bool){
		if let string = keyString {
			standard.set(value, forKey: string)
		} else if key != .nul {
			standard.set(value, forKey: key.rawValue)
		} else {
			switch keys {
				case .likesAndDislike(let keys, let twoParam):
					let key = keys.rawValue + (twoParam ?? "")
					standard.set(value, forKey: key)
        case .likesAndDislikeInfoButton(let keys, let twoParam):
          let key = keys.rawValue + (twoParam ?? "")
          standard.set(value, forKey: key)
				case .isOrder(let keys, let twoParam):
					let key = keys.rawValue + (twoParam ?? "")
					standard.set(value, forKey: key)
				case .nul:
					print("")
			}
		}
	}
  public func getString(key: StoreProjectKey.Key = StoreProjectKey.Key.nul, keys: StoreProjectKey.Keys = .nul, keyString: String? = nil) -> String {
		if let string = keyString {
			return standard.string(forKey: string) ?? ""
		} else if key != .nul {
			return standard.string(forKey: key.rawValue) ?? ""
		} else {
			switch keys {
				case .likesAndDislike(let oneParam, let twoParam):
					let key = oneParam.rawValue + (twoParam ?? "")
					return standard.string(forKey: key) ?? ""
        case .likesAndDislikeInfoButton(let oneParam, let twoParam):
          let key = oneParam.rawValue + (twoParam ?? "")
          return standard.string(forKey: key) ?? ""
				case .isOrder(let oneParam, let twoParam):
					let key = oneParam.rawValue + (twoParam ?? "")
					return standard.string(forKey: key) ?? ""
				case .nul:
					return ""
			}
		}
	}
  public func saveString(key: StoreProjectKey.Key = .nul, keys: StoreProjectKey.Keys = .nul, keyString: String? = nil, value: String?){
		
		if let string = keyString {
			standard.set(value, forKey: string)
		} else if key != .nul {
			standard.set(value, forKey: key.rawValue)
		} else {
			switch keys {
				case .likesAndDislike(let keys, let twoParam):
					let key = keys.rawValue + (twoParam ?? "")
					standard.set(value, forKey: key)
        case .likesAndDislikeInfoButton(let keys, let twoParam):
          let key = keys.rawValue + (twoParam ?? "")
          standard.set(value, forKey: key)
				case .isOrder(let keys, let twoParam):
					let key = keys.rawValue + (twoParam ?? "")
					standard.set(value, forKey: key)
				case .nul:
					print("")
			}
		}
	}
  public func getInt(key: StoreProjectKey.Key = StoreProjectKey.Key.nul, keys: StoreProjectKey.Keys = .nul, keyString: String? = nil) -> Int? {
		if let string = keyString {
			return standard.integer(forKey: string)
		} else if key != .nul {
			return standard.integer(forKey: key.rawValue)
		} else {
			switch keys {
				case .likesAndDislike(let oneParam, let twoParam):
					let key = oneParam.rawValue + (twoParam ?? "")
					return standard.integer(forKey: key)
        case .likesAndDislikeInfoButton(let oneParam, let twoParam):
          let key = oneParam.rawValue + (twoParam ?? "")
          return standard.integer(forKey: key)
				case .isOrder(let oneParam, let twoParam):
					let key = oneParam.rawValue + (twoParam ?? "")
					return standard.integer(forKey: key)
				case .nul:
					 return nil
			}
		}
	}
  public func saveInt(key: StoreProjectKey.Key = .nul, keys: StoreProjectKey.Keys = .nul, keyString: String? = nil, value: Int?){
		if let string = keyString {
			standard.set(value, forKey: string)
		} else if key != .nul {
			standard.set(value, forKey: key.rawValue)
		} else {
			switch keys {
				case .likesAndDislike(let keys, let twoParam):
					let key = keys.rawValue + (twoParam ?? "")
					standard.set(value, forKey: key)
        case .likesAndDislikeInfoButton(let keys, let twoParam):
          let key = keys.rawValue + (twoParam ?? "")
          standard.set(value, forKey: key)
				case .isOrder(let keys, let twoParam):
					let key = keys.rawValue + (twoParam ?? "")
					standard.set(value, forKey: key)
				case .nul:
					print("")
			}
		}
  }
  public func saveDouble(key: StoreProjectKey.Key, value: Double){
    standard.set(value, forKey: key.rawValue)
  }
  public func getDouble(key: StoreProjectKey.Key) -> Double {
     let double = standard.double(forKey: key.rawValue)
  return double
  }
  public func saveDate(key: StoreProjectKey.Key, date: Date, format: Date.FormatDate){
    let dateFormater = DateFormatter()
    dateFormater.dateFormat = format.rawValue
    let dateString = dateFormater.string(from: date)
    print(dateString)
    standard.set(dateString, forKey: key.rawValue)
  }
  public func getDate(key: StoreProjectKey.Key, format: Date.FormatDate) -> Date? {
    let dateFormater = DateFormatter()
    let dateString = standard.string(forKey: key.rawValue) ?? "April 6, 2020"
    dateFormater.dateFormat = format.rawValue
    let date = dateFormater.date(from: dateString)
  return date
  }
  public func getDictionary(key: StoreProjectKey.Key) -> [String: String]? {
		return standard.dictionary(forKey: key.rawValue) as? [String: String]
	}
  public func saveDictionary(key: StoreProjectKey.Key, dictionary: [String: String]){
		standard.set(dictionary, forKey: key.rawValue)
	}
  public func getAny(key: StoreProjectKey.Key) -> Any? {
    return standard.object(forKey: key.rawValue)
  }

  public func saveAny(key: StoreProjectKey.Key, any: Any?){
    standard.set(any, forKey: key.rawValue)
  }
}

class StoreProjectKey {
  
  enum Keys {
    case likesAndDislike(Key, String?)
    case isOrder(Key, String?)
    case likesAndDislikeInfoButton(Key, String?)
    case nul
  }
  enum Key: String {
    
    case nul
    case token
    case likesAndDislike
    case likesAndDislikeInfoButton
    case isRating
    case isRegistration
    case urlStatic
    case urlWebSocet
    case tgBot
    case awayURL
    case policyURL
    case mainVideo
    case apiURL
    case userID
    case isPromotionActive
    case isPromotionVideoSave
    case promotionDuration
    case isPrilend
    case fullDateType
    case exitDate
    case exitTime
    case isStartScreen
  }
}
