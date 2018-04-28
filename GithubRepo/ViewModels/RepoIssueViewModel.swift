//
//  RepoIssueViewModel.swift
//  GithubRepo
//
//  Created by Vishal on 28/04/18.
//  Copyright © 2018 Vishal Bhadade. All rights reserved.
//

import Foundation

class RepoIssueViewModel: NSObject {
    
    /// Repo title
    var issueTitle: String?
    
    override init() {
    }
    
    init(with model: RepoIssueModel?) {
        if let userModel = model, let title = userModel.title {
            issueTitle = title
        }
    }
}
