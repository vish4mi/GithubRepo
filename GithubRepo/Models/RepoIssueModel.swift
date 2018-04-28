//
//  RepoIssueModel.swift
//  GithubRepo
//
//  Created by Vishal on 28/04/18.
//  Copyright © 2018 Vishal Bhadade. All rights reserved.
//

import Foundation
import ObjectMapper

class RepoIssueModel: NSObject, Mappable {
    var url: String?
    var repositoryURL: String?
    var labelsURL: String?
    var commentsURL: String?
    var eventsURL: String?
    var htmlURL: String?
    var id: Int?
    var number: Int?
    var title: String?
    var user: UserModel?
    var labels: [Any?]?
    var state: String?
    var locked: Bool?
    var assignee: NSNull?
    var assignees: [Any?]?
    var milestone: NSNull?
    var comments: Int?
    var createdAt: String?
    var updatedAt: String?
    var closedAt: String?
    var authorAssociation: String?
    var body: String?
    var closedBy: UserModel?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        url           <- map["url"]
        repositoryURL <- map["repositoryURL"]
        labelsURL     <- map["labelsURL"]
        commentsURL   <- map["commentsURL"]
        eventsURL     <- map["eventsURL"]
        htmlURL       <- map["htmlURL"]
        number        <- map["number"]
        title         <- map["title"]
        user          <- map["user"]
        labels        <- map["labels"]
        state         <- map["state"]
        locked        <- map["locked"]
        assignee      <- map["assignee"]
        assignees     <- map["assignees"]
        milestone     <- map["milestone"]
        comments      <- map["comments"]
        createdAt     <- map["createdAt"]
        updatedAt     <- map["updatedAt"]
        closedAt      <- map["closedAt"]
        authorAssociation <- map["authorAssociation"]
        body          <- map["body"]
        closedBy      <- map["closedBy"]
    }
}
