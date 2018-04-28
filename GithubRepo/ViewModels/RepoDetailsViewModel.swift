//
//  RepoDetailsViewModel.swift
//  GithubRepo
//
//  Created by Vishal on 28/04/18.
//  Copyright © 2018 Vishal Bhadade. All rights reserved.
//

import Foundation

class RepoDetailsViewModel: NSObject {
    
    /// Repo title
    var repoDescription: String?
    var contributorsURL: String?
    var issuesURL: String?
        
    
    init(with model: RepositoryModel?) {
        if let repoModel = model {
            repoDescription = repoModel.desc
            contributorsURL = repoModel.contributors_url
            issuesURL = repoModel.issues_url
        }
    }
}
