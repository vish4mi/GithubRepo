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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}

extension GitHubRepoListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let aCell: GitHubRepoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: repoCollectionCellIdentifier, for: indexPath) as! GitHubRepoCollectionViewCell
        return aCell
    }
    
    
}
