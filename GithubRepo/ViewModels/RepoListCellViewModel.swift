//
//  RepoListCellViewModel.swift
//  GithubRepo
//
//  Created by Vishal on 27/04/18.
//  Copyright © 2018 Vishal Bhadade. All rights reserved.
//

import Foundation

class RepoListCellViewModel: NSObject {
    
    /// Content Title
    internal var title: String?
    
    /// Content Image
    internal var image: String?
    
    /// Content rating
    internal var rating: String?
    
    /// Release year
    internal var releaseYear: String?
    
    /// Genre
    internal var genre: String?
    
    
    init(with model: RepositoryModel) {
        
    }
}
