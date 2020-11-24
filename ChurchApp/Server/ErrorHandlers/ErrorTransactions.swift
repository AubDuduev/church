//
//  ErrorTransactions.swift
//  DgBetTrip
//
//  Created by Senior Developer on 12.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import UIKit

class ErrorTransactions {
  
  public func check(activeSubscribe: DECTransaction?){
    
    do {
      try self.errors(activeSubscribe: activeSubscribe)
      //payment error
    } catch Transactions.PaymentError {
      AlertEK.dеfault(title: .error, message: .errorTransactions)
      //failed payment
    } catch Transactions.FailedPayment {
      AlertEK.dеfault(title: .error, message: .error)
      //error
    } catch Transactions.Error {
      AlertEK.dеfault(title: .error, message: .error)
      //error
    } catch Transactions.DescriptionError(let error) {
      AlertEK.customText(title: .error, message: .message(error))
      //successful payment
    } catch Transactions.SuccessfulPayment {
      AlertEK.dеfault(title: .success, message: .successActiveSubscribe)
      //Error unknown
    } catch {
      AlertEK.dеfault(title: .error, message: .errorUnknown)
    }
  }
  private func errors(activeSubscribe: DECTransaction?) throws {
    //payment error
    guard let activeSubscribe = activeSubscribe else {
      throw Transactions.FailedPayment
    }
    //successful payment
    if let secces = activeSubscribe.sussesPay, secces {
      throw Transactions.SuccessfulPayment
    //successful payment
    } else if let secces = activeSubscribe.success, secces {
      throw Transactions.SuccessfulPayment
    //failed payment
    } else if let secces = activeSubscribe.success, !secces {
      throw Transactions.FailedPayment
    }
    //error
    if let error = activeSubscribe.errors {
      throw Transactions.DescriptionError(error)
    } else {
      throw Transactions.Error
    }
  }
  
  enum Transactions: LocalizedError, Error {
    
    case PaymentError
    case SuccessfulPayment
    case FailedPayment
    case DescriptionError(String)
    case Error
  }
}
