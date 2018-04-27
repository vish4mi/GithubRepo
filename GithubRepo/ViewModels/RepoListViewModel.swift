//
//  RepoListViewModel.swift
//  GithubRepo
//
//  Created by Vishal on 27/04/18.
//  Copyright © 2018 Vishal Bhadade. All rights reserved.
//

import Foundation

class RepoListViewModel: NSObject {
    
    /// Repo title
    var repoCount: Int?
    var repoModels: [RepositoryModel]?
    
    
    init(with model: RepositoryDataModel?) {
        if let repoDataModel = model, let repoListModels = repoDataModel.items {
            repoCount = repoListModels.count
            repoModels = repoListModels
        }
    }
}
