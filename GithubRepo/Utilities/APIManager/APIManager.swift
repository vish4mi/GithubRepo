//
//  APIManager.swift
//  GithubRepo
//
//  Created by Vishal on 26/04/18.
//  Copyright © 2018 Vishal Bhadade. All rights reserved.
//


import Foundation


class APIManager: NSObject {
    
    static let sharedManager: APIManager = {
        let instance = APIManager()
        // setup code
        return instance
    }()
    
    /// Get movies data
//    func getRepositoryData(withLanguage language: String, and completion: @escaping([RepositoryModel]?, Error?) -> Void) {
//        let urlString = Constants.APIServiceMethods.searchRepoAPI
//        // Set up the URL request
//        guard let url = URL(string: urlString) else {
//            print("Error: cannot create URL")
//            return
//        }
//        let urlRequest = URLRequest(url: url)
//        
//        // set up the session
//        let config = URLSessionConfiguration.default
//        let session = URLSession(configuration: config)
//        
//        // make the request
//        let task = session.dataTask(with: urlRequest) {(data, response, error) in
//            // check for any errors
//            guard error == nil else {
//                print("error calling GET")
//                print(error!)
//                return
//            }
//            // make sure we got data
//            guard let responseData = data else {
//                print("Error: did not receive data")
//                return
//            }
//            // parse the result as JSON, since that's what the API provides
//            do {
//                guard let responseArray = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers) as? [[String: Any]] else {
//                    print("error trying to convert data to JSON")
//                    return
//                }
//                let repositoryModel = Mapper<RepositoryModel>().mapArray(JSONArray: responseArray)
//                DispatchQueue.main.async {
//                    completion(repositoryModel, nil)
//                }
//                
//            } catch let error as NSError {
//                print("error trying to convert data to JSON")
//                DispatchQueue.main.async {
//                    completion(nil, error)
//                }
//                return
//            }
//        }
//        task.resume()
//    }
}
