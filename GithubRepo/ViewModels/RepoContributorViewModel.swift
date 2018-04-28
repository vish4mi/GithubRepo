//
//  RepoContributorViewModel.swift
//  GithubRepo
//
//  Created by Vishal on 28/04/18.
//  Copyright © 2018 Vishal Bhadade. All rights reserved.
//

import Foundation

class RepoContributorViewModel: NSObject {
    
    /// Repo title
    var userImageURL: String?
    var userName: String?
    var userInfo: String?
    
    override init() {
    }
    
    init(with model: UserModel?) {
        if let userModel = model {
            userImageURL = userModel.avatar_url
            userName = userModel.login
            if let contributionInfo = userModel.contributions {
                userInfo = "\(contributionInfo)"
            }
        }
    }
}
