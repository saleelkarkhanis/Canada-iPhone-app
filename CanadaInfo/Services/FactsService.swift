//
//  FactsService.swift
//  CanadaInfo
//
//  Created by synerzip on 21/02/18.
//  Copyright © 2018 saleelkarkhanis. All rights reserved.
//

import Foundation
import SwiftyJSON

class FactsService {
    
    static func sendGetFactsRequest(_ completionCallback: @escaping CompletionCallback) {
        APIClient.sendRequest(.get, path: "facts.json", successCallback: { (task, jsonData) in
            if let jsonData = jsonData {
                JSONDataMapper.mapFactsData(fromResponse: jsonData, completion: completionCallback)
            }
        }) { (task, error) in
            if let error = error {
                completionCallback(.failure(error))
            }
        }
    }
}

class JSONDataMapper {
    
    static func mapFactsData(fromResponse jsonResponse: Data, completion: CompletionCallback) {
        let json = JSON(jsonResponse)
        
        // Map JSON Response into Fact Model
        let pageTitle = json[apiKeyConstants.title].string ?? appDefaults.emptyString
        let rows = json[apiKeyConstants.rows].array ?? []
        
        var facts = [Fact]()
        for row in rows {
            let fact = Fact(withJSON: row)
            facts.append(fact)
        }
        completion(.success((facts, pageTitle)))
    }
}
