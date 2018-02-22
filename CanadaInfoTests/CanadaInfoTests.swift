//
//  CanadaInfoTests.swift
//  CanadaInfoTests
//
//  Created by synerzip on 21/02/18.
//  Copyright © 2018 saleelkarkhanis. All rights reserved.
//

import XCTest
import SwiftyJSON

@testable import CanadaInfo

class CanadaInfoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFactsResponseJSON() {
        
        let bundle = Bundle(for: type(of: self))
        guard let factsJSONFilePath = bundle.path(forResource: "facts", ofType: "json"),
            let factsData = try? Data(contentsOf: URL(fileURLWithPath: factsJSONFilePath))
            else {
                XCTFail("JSON Data Not Available")
                return
        }
        do {
            let factsJsonObject = try JSON(data: factsData)
            let pageTitle = factsJsonObject["title"].string
            if pageTitle == nil {
                XCTFail("Missing Required Data")
            }
            
            let rows = factsJsonObject["rows"].array
            if rows == nil {
                XCTFail("Missing Required Data")
            }
        }
        catch{
            XCTFail("Data Not Convirtible to JSON")
        }
    }
    
    func testFactsPageTitle() {
        
    }
    
    func testFactsList() {
        
    }
}
