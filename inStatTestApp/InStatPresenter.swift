//
//  inStatPresenter.swift
//  inStatTestApp
//
//  Created by Leonid Vilner on 25/02/2021.
//  Copyright © 2021 Andrey Vilner. All rights reserved.
//

import Foundation
import Alamofire

protocol InStatPresenterProtocol: class {
    func loadData()
}

class InStatPresenter {
    
    weak var view: InStatPresenterProtocol?
    
    var model = InStatModel()
    
    init(with view: InStatPresenterProtocol) {
        self.view = view
    }
   
    weak var delegate: InStatPresenterProtocol?
    
}

extension ViewController: InStatPresenterProtocol {
    
    func loadData() {
        
        let inStatURL = "https://api.instat.tv/test/data"
        
        let headers: HTTPHeaders = [
                "Content-Type": "aapplication/json"]
            let inStatBody: [String:Any] = [
                  "proc": "get_match_info",
                  "params": [
                    "_p_sport":1,
                   "_p_match_id": 1724836
                ]
            ]
        
            let inStatParam: [String:Any] = [
                "_p_sport" : 1,
                "_p_match_id" : 1724836]
        
        Alamofire.request(inStatURL, method: .post, parameters: inStatBody, encoding: JSONEncoding.default, headers: headers)
                .responseData { response in
                    do {
                        print("Making request for match")
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let response = try decoder.decode(InStatModel.inStatResponse.self, from: response.data!)
                        print("Response match \(response)")
                        DispatchQueue.main.async {
                            self.topLabel.text = "Team 1 id: \(response.team1.id!) - Team 2 id: \(response.team2.id!)"
                        }
                    } catch let error {
                        print(error)
                    }
            }
        }
    
    func loadLink() {
        
        let insStatLinkURL = "https://api.instat.tv/test/video-urls"
        
        let headers: HTTPHeaders = [
                "Content-Type": "aapplication/json"
            ]
                
        let inStatLink: [String:Any] = [
                "match_id":1724836,
                "sport_id":1
            ]
         Alamofire.request(insStatLinkURL, method: .post, parameters: inStatLink, encoding: JSONEncoding.default, headers: headers)
            .responseData { response in
                
                do {
                    print("Making request for links")
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    //print(response.response)
                    let response = try decoder.decode([InStatModel.inStatLinkResponse].self, from: response.data!)
                    print("Response links \(response)")
                    let links = response
                    for link in links {
                        self.links.append(InStatModel.linkArray(name: link.name, quality: link.quality, url: link.url))
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.activityIndicator.stopAnimating()
                        self.activityIndicator.isHidden = true
                    }
                } catch let error {
                    print(error)
                }
        }
            
    }
    
}

