//
//  LicenseModel.swift
//  GithubRepo
//
//  Created by Vishal on 27/04/18.
//  Copyright © 2018 Vishal Bhadade. All rights reserved.
//

import Foundation
import ObjectMapper

class LicenseModel: NSObject, Mappable {
    
    var key: String?
    var name: String?
    var spdx_id: String?
    var url: String?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        key     <- map["key"]
        name    <- map["name"]
        spdx_id <- map["spdx_id"]
        url     <- map["url"]
    }
}
