//
//  GitHubRepoListViewController.swift
//  GithubRepo
//
//  Created by Vishal on 27/04/18.
//  Copyright © 2018 Vishal Bhadade. All rights reserved.
//

import UIKit

class GitHubRepoListViewController: UIViewController {

    @IBOutlet weak var gitHubRepoCollectionView: UICollectionView!
    fileprivate let repoCollectionCellIdentifier = "GitHubRepoCollectionViewCell"
    var repoListViewModel: RepoListViewModel?
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    fileprivate var selectedIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureView() {
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.SHOW_REPO_DETAILS_VC_SEGUE {
            if let gitHubRepoDetailsVC: GitHubRepoDetailsViewController = segue.destination as? GitHubRepoDetailsViewController {
                gitHubRepoDetailsVC.repoListViewModel = repoListViewModel
                gitHubRepoDetailsVC.selectedIndexPath = selectedIndexPath
            }
        }
    }

}

extension GitHubRepoListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let repoListViewModel = self.repoListViewModel, let repoCount = repoListViewModel.repoCount {
            return repoCount
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let aCell: GitHubRepoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: repoCollectionCellIdentifier, for: indexPath) as! GitHubRepoCollectionViewCell
        
        if let repoListViewModel = self.repoListViewModel, let repoModels = repoListViewModel.repoModels, indexPath.row < repoModels.count {
            let repoModel = repoModels[indexPath.row]
            let repoViewModel = RepoListCellViewModel(with: repoModel)
            aCell.setupCell(with: repoViewModel)
            aCell.layoutIfNeeded()
        }
        return aCell
    }
    
    
}

// MARK: UICollectionViewDelegateFlowLayout
extension GitHubRepoListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = gitHubRepoCollectionView.frame.width
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

extension GitHubRepoListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let repoListViewModel = self.repoListViewModel, let repoModels = repoListViewModel.repoModels, indexPath.row < repoModels.count {
            selectedIndexPath = indexPath
            self.performSegue(withIdentifier: Constants.SHOW_REPO_DETAILS_VC_SEGUE, sender: self)
        }
    }
}
