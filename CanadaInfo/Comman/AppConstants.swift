//
//  AppConstants.swift
//  CanadaInfo
//
//  Created by synerzip on 21/02/18.
//  Copyright © 2018 saleelkarkhanis. All rights reserved.
//

import Foundation

public enum CompletionResponse {
    case success(Any?)
    case failure(NSError)
    
    func isSuccess() -> Any? {
        
        switch self {
        case .failure(_):
            return false as Any?
        case .success(let success):
            return success
        }
    }
}

typealias CompletionCallback = (CompletionResponse) -> ()
typealias SuccessCallback = (URLSessionTask?, Data?) -> Void
typealias ErrorCallback = (URLSessionTask?, NSError?) -> Void

class AppConstants {
    static let apiBaseURL = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/"
}

