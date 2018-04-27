//
//  RepoListCellViewModel.swift
//  GithubRepo
//
//  Created by Vishal on 27/04/18.
//  Copyright © 2018 Vishal Bhadade. All rights reserved.
//

import Foundation

class RepoListCellViewModel: NSObject {
    
    /// Repo title
    var repoTitle: String?
    var repositoryModel: RepositoryModel?
    
    
    init(with model: RepositoryModel?) {
        if let repoModel = model {
            repoTitle = repoModel.name
            repositoryModel = repoModel
        }
    }
}
