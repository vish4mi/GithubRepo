//
//  UserModel.swift
//  GithubRepo
//
//  Created by Vishal on 27/04/18.
//  Copyright © 2018 Vishal Bhadade. All rights reserved.
//

import Foundation
import ObjectMapper

class UserModel: NSObject, Mappable {
    
    var login: String?
    var id: Int64?
    var avatar_url: String?
    var gravatar_id: String?
    var url: String?
    var html_url: String?
    var followers_url: String?
    var following_url: String?
    var gists_url: String?
    var starred_url: String?
    var subscriptions_url: String?
    var organizations_url: String?
    var repos_url: String?
    var events_url: String?
    var received_events_url: String?
    var type: String?
    var site_admin: Bool?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        login            <- map["login"]
        id               <- map["id"]
        avatar_url       <- map["avatar_url"]
        gravatar_id      <- map["gravatar_id"]
        url              <- map["url"]
        html_url         <- map["html_url"]
        followers_url    <- map["followers_url"]
        following_url    <- map["following_url"]
        gists_url        <- map["gists_url"]
        starred_url      <- map["starred_url"]
        subscriptions_url <- map["subscriptions_url"]
        organizations_url <- map["organizations_url"]
        repos_url         <- map["repos_url"]
        events_url        <- map["events_url"]
        received_events_url <- map["received_events_url"]
        type                <- map["type"]
        site_admin        <- map["site_admin"]

    }
}
