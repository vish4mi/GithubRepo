//
//  GitHubRepoCollectionViewCell.swift
//  GithubRepo
//
//  Created by Vishal on 27/04/18.
//  Copyright © 2018 Vishal Bhadade. All rights reserved.
//

import UIKit

class GitHubRepoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var repoTitleLabel: UILabel!
    fileprivate var repoListCellViewModel: RepoListCellViewModel?
    
    func setupCell(with repoViewModel: RepoListCellViewModel?) {
        if let aViewModel = repoViewModel {
            repoListCellViewModel = aViewModel
            if let repoTitle = aViewModel.repoTitle {
                repoTitleLabel.text = repoTitle
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
}
