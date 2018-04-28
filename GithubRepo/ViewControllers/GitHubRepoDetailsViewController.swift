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

    @IBOutlet weak var repoPageControl: UIPageControl!
    @IBOutlet weak var repoDetailsCollectionView: UICollectionView!
    var repoListViewModel: RepoListViewModel?
    var selectedIndexPath: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        //repoDetailsCollectionView.reloadData()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let indexPath = selectedIndexPath {
            repoDetailsCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension GitHubRepoDetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let repoListViewModel = self.repoListViewModel, let repoCount = repoListViewModel.repoCount {
            repoPageControl.numberOfPages = repoCount
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
        return CGSize(width: collectionViewWidth, height: collectionViewHeight)
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
