//
//  JSONString.swift
//  DgBetTrip
//
//  Created by Senior Developer on 28.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

class JSONString {
  
  func parse<T: Decodable>(string: String, jsonType: T.Type ,complition: @escaping Clousure<T>) {
    
    guard let data = string.data(using: .utf8) else { return }
    do{
      let decoder = JSONDecoder()
      let json = try decoder.decode(T.self, from: data)
      complition(json)
      //return error
    } catch let error {
      print(error.localizedDescription, "Error parse JSON ")
    }
  }
}

