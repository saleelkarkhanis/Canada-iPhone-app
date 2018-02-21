//
//  CanadaInfoElement.swift
//  CanadaInfo
//
//  Created by synerzip on 21/02/18.
//  Copyright © 2018 saleelkarkhanis. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Fact {
    var title: String
    var description: String
    var imageURL: String
    
    init (withJSON jsonObject: JSON) {
        title = jsonObject["title"].string ?? ""
        description = jsonObject["description"].string ?? ""
        imageURL = jsonObject["imageHref"].string ?? ""
    }
}
