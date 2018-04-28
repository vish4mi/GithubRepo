//
//  GitHubRepoDetailsViewCell.swift
//  GithubRepo
//
//  Created by Vishal on 28/04/18.
//  Copyright © 2018 Vishal Bhadade. All rights reserved.
//

import UIKit

class GitHubRepoDetailsViewCell: UICollectionViewCell {
    
    @IBOutlet weak var repoDescriptionLabel: UILabel!
    @IBOutlet weak var topIssuesCollectionView: UICollectionView!
    @IBOutlet weak var topContributorsCollectionView: UICollectionView!
    fileprivate let repoIssueCellIdentifier = "RepoIssueViewCell"
    fileprivate let repoContributorCellIdentifier = "RepoContributorViewCell"
    fileprivate let cellReuseIdentifier = "cell"
    var issueViewModels: [RepoIssueViewModel]?
    var repoContributorViewModels: [RepoContributorViewModel]?
    var repoDetailsViewModel: RepoDetailsViewModel?

    func configure() {
        topIssuesCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        topContributorsCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
    }
    
    func setupCell(with repoViewModel: RepoDetailsViewModel?) {
        if let aViewModel = repoViewModel {
            if let description = aViewModel.repoDescription {
                repoDescriptionLabel.text = description
                repoDescriptionLabel.textAlignment = .left
            } else {
                repoDescriptionLabel.text = "Not Available"
                repoDescriptionLabel.textAlignment = .center
            }
            
            if let issueURL = aViewModel.issuesURL {
                fetchRepoIssues(withURL: issueURL)
            }
            
            if let contributorURL = aViewModel.contributorsURL {
                fetchRepoContributors(withURL: contributorURL)
            }
        }
    }
    
    func fetchRepoIssues(withURL urlString: String) {
        for i in 1...3 {
            APIManager.sharedManager.getRepositoryIssues(withURL: urlString, issueNumber: i) { (aModel, error) in
                if let issueModel = aModel {
                    let issueViewModel = RepoIssueViewModel(with: issueModel)
                    if self.issueViewModels == nil {
                        self.issueViewModels = [RepoIssueViewModel]()
                    }
                    self.issueViewModels?.append(issueViewModel)
                }
                self.topIssuesCollectionView.reloadData()
            }
        }
    }
    
    func fetchRepoContributors(withURL urlString: String) {
        APIManager.sharedManager.getRepositoryContributors(withURL: urlString) { (contribModels, error) in
            if let userModels = contribModels {
                for userModel in userModels {
                    let userViewModel = RepoContributorViewModel(with: userModel)
                    if self.repoContributorViewModels == nil {
                        self.repoContributorViewModels = [RepoContributorViewModel]()
                    }
                    self.repoContributorViewModels?.append(userViewModel)
                }
                self.topContributorsCollectionView.reloadData()
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

extension GitHubRepoDetailsViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var numberOfItems = 0
        if collectionView == topIssuesCollectionView {
            if let issueViewModels = self.issueViewModels {
                numberOfItems = issueViewModels.count
            }
        } else if collectionView == topContributorsCollectionView {
            if let userViewModels = self.repoContributorViewModels {
                numberOfItems = userViewModels.count
            }
        }
        
        return numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath)
        
        if collectionView == topIssuesCollectionView {
            let aCell: RepoIssueViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: repoIssueCellIdentifier, for: indexPath) as! RepoIssueViewCell
            
            if let issueViewModels = self.issueViewModels, indexPath.row < issueViewModels.count {
                let issueViewModel = issueViewModels[indexPath.row]
                aCell.setupCell(with: issueViewModel)
                aCell.layoutIfNeeded()
            }
            cell = aCell
            
        } else if collectionView == topContributorsCollectionView {
            let aCell: RepoContributorViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: repoContributorCellIdentifier, for: indexPath) as! RepoContributorViewCell
            
            if let userViewModels = self.repoContributorViewModels, indexPath.row < userViewModels.count {
                let userViewModel = userViewModels[indexPath.row]
                aCell.setupCell(with: userViewModel)
                aCell.layoutIfNeeded()
            }
            cell = aCell
        }
        
        return cell
    }
    
    
}

// MARK: UICollectionViewDelegateFlowLayout
extension GitHubRepoDetailsViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.frame.width
        return CGSize(width: collectionViewWidth, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        var insets = UIEdgeInsets.zero
        insets = UIEdgeInsets.init(top: 0, left: 0, bottom: 10, right: 0)
        return insets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
