//
//  GitHubRepoDetailsViewController.swift
//  GithubRepo
//
//  Created by Vishal on 28/04/18.
//  Copyright © 2018 Vishal Bhadade. All rights reserved.
//

import UIKit

private let repoDetailsViewCellIdentifier = "GitHubRepoDetailsViewCell"

class GitHubRepoDetailsViewController: UIViewController {

    @IBOutlet weak var repoDetailsCollectionView: UICollectionView!
    var repoListViewModel: RepoListViewModel?
    var selectedIndexPath: IndexPath?
    var initialScrollDone = false
    
    override func viewDidLoad() {
        super.viewDidLoad()        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let visibleIndexPaths = repoDetailsCollectionView.indexPathsForVisibleItems
        if visibleIndexPaths.count > 0 {
            let visibleIndexPath  = visibleIndexPaths[0]
            selectedIndexPath = visibleIndexPath
            if let aModel = repoListViewModel, let repoModels = aModel.repoModels, visibleIndexPath.row < repoModels.count {
                let repoModel = repoModels[visibleIndexPath.row]
                let repoViewModel = RepoListCellViewModel(with: repoModel)
                navigationItem.title = repoViewModel.repoTitle
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if !initialScrollDone {
            initialScrollDone = true
            if let indexPath = selectedIndexPath {
                repoDetailsCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
            }
        }
    }
}

extension GitHubRepoDetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let repoListViewModel = self.repoListViewModel, let repoCount = repoListViewModel.repoCount {
            return repoCount
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let aCell: GitHubRepoDetailsViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: repoDetailsViewCellIdentifier, for: indexPath) as! GitHubRepoDetailsViewCell
        aCell.configure()
        if let repoListViewModel = self.repoListViewModel, let repoModels = repoListViewModel.repoModels, indexPath.row < repoModels.count {
            let repoModel = repoModels[indexPath.row]
            let repoViewModel = RepoDetailsViewModel(with: repoModel)
            aCell.setupCell(with: repoViewModel)
            aCell.layoutIfNeeded()
        }
        return aCell
    }
    
    
}

// MARK: UICollectionViewDelegateFlowLayout
extension GitHubRepoDetailsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = repoDetailsCollectionView.frame.width
        let collectionViewHeight = repoDetailsCollectionView.frame.height
        return CGSize(width: collectionViewWidth-10, height: collectionViewHeight-10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        var insets = UIEdgeInsets.zero
        insets = UIEdgeInsets.init(top: 5, left: 5, bottom: 5, right: 5)
        return insets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

extension GitHubRepoDetailsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let visibleIndexPaths = collectionView.indexPathsForVisibleItems
        if visibleIndexPaths.count > 0 {
            let visibleIndexPath  = visibleIndexPaths[0]
            selectedIndexPath = visibleIndexPath
            if let aModel = repoListViewModel, let repoModels = aModel.repoModels, visibleIndexPath.row < repoModels.count {
                let repoModel = repoModels[visibleIndexPath.row]
                let repoViewModel = RepoListCellViewModel(with: repoModel)
                navigationItem.title = repoViewModel.repoTitle
            }
        }
    }
}
