//
//  RepoContributorViewCell.swift
//  GithubRepo
//
//  Created by Vishal on 28/04/18.
//  Copyright © 2018 Vishal Bhadade. All rights reserved.
//

import UIKit
import Kingfisher

class RepoContributorViewCell: UICollectionViewCell {
    
    @IBOutlet weak var contributorNameLabel: UILabel!
    @IBOutlet weak var contributorInfoLabel: UILabel!
    @IBOutlet weak var contributorProfileImageView: UIImageView!
    
    func setupCell(with repoViewModel: RepoContributorViewModel?) {
        if let aViewModel = repoViewModel {
            if let userName = aViewModel.userName {
                contributorNameLabel.text = userName
            } else {
                contributorNameLabel.text = "Not Available"
            }
            
            if let userInfo = aViewModel.userInfo {
                contributorInfoLabel.text = userInfo + " " + "contributions"
            } else {
                contributorInfoLabel.text = ""
            }
            
            if let avtarURL = aViewModel.userImageURL {
                contributorProfileImageView.kf.setImage(with: URL(string: avtarURL), placeholder: "profile.png" as? Placeholder, options: nil, progressBlock: nil, completionHandler: nil)
            }
        }
    }
    
}
