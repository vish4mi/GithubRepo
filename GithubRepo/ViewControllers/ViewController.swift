//
//  ViewController.swift
//  GithubRepo
//
//  Created by Vishal on 26/04/18.
//  Copyright © 2018 Vishal Bhadade. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var languageTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    fileprivate var searchString: String? = nil
    fileprivate var repoListViewModel: RepoListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.SHOW_REPO_LIST_VC_SEGUE {
            if let gitHubRepoListVC: GitHubRepoListViewController = segue.destination as? GitHubRepoListViewController {
                gitHubRepoListVC.repoListViewModel = repoListViewModel
            }
        }
    }
    
    
    @IBAction func searchButtonClicked(_ sender: UIButton) {
        if let searchKey = searchString {
            self.view.showActivityIndicator()
            APIManager.sharedManager.getRepositoryData(withLanguage: searchKey) { (repoDataModel, error) in
                self.view.hideActivityIndicator()
                if let repoData = repoDataModel {
                    self.repoListViewModel = RepoListViewModel(with: repoData)
                    self.performSegue(withIdentifier: Constants.SHOW_REPO_LIST_VC_SEGUE, sender: self)
                }
            }
        }
    }
    
    
    
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let oldText = textField.text {
            searchString = oldText + string
        }
        
        return true
    }
}
