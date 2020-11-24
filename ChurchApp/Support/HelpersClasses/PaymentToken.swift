//
//  PaymentToken.swift
//  DgBetTrip
//
//  Created by Senior Developer on 11.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//

import Foundation

class PaymentTransaction {
  
  static let shared        = PaymentTransaction()
  private let server       = Server()
  private let errorHandler = ErrorTransactions()
  
  public func pay(encTransaction: ENCTransaction){
    //Request
    self.server.request(requestType: .POSTTransaction, data: encTransaction) { [unowned self] (serverResult) in
      //Response
      switch serverResult {
        case .error(let error):
          guard let error = error else { return }
          print("Error server data: class: PaymentTransaction ->, function: transaction -> data: DECTransaction ->, description: ", error.localizedDescription)
          AlertEK.dеfault(title: .error, message: .noJSON)
        //Susses
        case .object(let object):
          let transaction  = object as! DECTransaction
          self.errorHandler.check(activeSubscribe: transaction)
          print("Succesful data: class: PaymentTransaction ->, function: transaction ->, data: DECTransaction")
        
      }
    }
  }
  private init(){}
}
