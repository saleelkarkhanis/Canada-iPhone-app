//
//  UILabel+Helper.swift
//  CanadaInfo
//
//  Created by synerzip on 22/02/18.
//  Copyright © 2018 saleelkarkhanis. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    func multiline() {
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
    }
}
