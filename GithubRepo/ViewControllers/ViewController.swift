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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func searchButtonClicked(_ sender: UIButton) {
        if let searchKey = searchString {
            APIManager.sharedManager.getRepositoryData(withLanguage: searchKey) { (repoDataModel, error) in
                
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
