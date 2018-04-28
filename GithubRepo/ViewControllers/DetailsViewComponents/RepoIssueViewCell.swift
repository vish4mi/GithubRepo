//
//  RepoIssueViewCell.swift
//  GithubRepo
//
//  Created by Vishal on 28/04/18.
//  Copyright © 2018 Vishal Bhadade. All rights reserved.
//

import UIKit

class RepoIssueViewCell: UICollectionViewCell {
    
    @IBOutlet weak var issueTitleLabel: UILabel!
    @IBOutlet weak var issueInfoLabel: UILabel!
    
    func setupCell(with repoIssueViewModel: RepoIssueViewModel?) {
        if let aViewModel = repoIssueViewModel {
            if let issueTitle = aViewModel.issueTitle {
                issueTitleLabel.text = issueTitle
            } else {
                issueTitleLabel.text = "Not Available"
            }
        }
    }
    
}
