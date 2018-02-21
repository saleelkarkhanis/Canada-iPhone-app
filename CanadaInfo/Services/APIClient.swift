//
//  APIClient.swift
//  CanadaInfo
//
//  Created by synerzip on 21/02/18.
//  Copyright © 2018 saleelkarkhanis. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {
    
    static func sendRequest(_ methodType: Alamofire.HTTPMethod,
                            path: String,
                            parameters: [String: Any]? = nil,
                            headers: [String: String]? = nil,
                            successCallback: SuccessCallback?,
                            errorCallback: ErrorCallback?) {
        
        let apiURLString = apiBaseURL + path
        
        let request = Alamofire.request(apiURLString, method: .post, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .validate { request, response, data in
                return .success
        }

        request.responseData { (resposnse) in
            if let resultData = resposnse.data, let successBlock = successCallback {
                let str = String(data: resultData, encoding: String.Encoding.isoLatin1)
                let data = str?.data(using: String.Encoding.utf8)
                successBlock(request.task, data)
            }

            if let error = resposnse.result.error, let errorBlock = errorCallback {
                errorBlock(request.task, error as NSError?)
            }
        }
    }
}
