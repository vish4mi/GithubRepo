//
//  RepositoryDataModel.swift
//  GithubRepo
//
//  Created by Vishal on 27/04/18.
//  Copyright © 2018 Vishal Bhadade. All rights reserved.
//

import Foundation
import ObjectMapper

class RepositoryDataModel: NSObject, Mappable {
    
    var total_count: Int64?
    var incomplete_results: Bool?
    var items: [RepositoryModel]?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        total_count        <- map["total_count"]
        incomplete_results <- map["incomplete_results"]
        items              <- map["items"]
    }
}
