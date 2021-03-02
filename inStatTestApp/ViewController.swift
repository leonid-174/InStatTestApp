//
//  ViewController.swift
//  inStatTestApp
//
//  Created by Leonid Vilner on 25/02/2021.
//  Copyright © 2021 Andrey Vilner. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController, UITableViewDelegate {
    
    lazy var presenter = InStatPresenter(with: self)
    
    var model = InStatModel()
    
    var links = [InStatModel.linkArray]()
    var inStatLinksArray: [InStatModel.inStatLinkResponse] = []
    
    var selectedVideo = 0
    
    @IBOutlet var topLabel: UILabel!
    
    @IBOutlet var tableView: UITableView!

    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
        
        view.bringSubviewToFront(activityIndicator)
        activityIndicator.startAnimating()
        
        self.loadData()
        self.loadLink()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "watchMatch") {
            let destination = segue.destination as! WatchController
            destination.videoURL = links[selectedVideo].url!
        }
    }

    
}
 
extension ViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Links quantity: \(links.count)")
        return links.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        let titleLabel = UILabel()
        titleLabel.frame = CGRect(x: 10, y: 5, width: cell.frame.width - 60, height: cell.frame.height - 10)
        titleLabel.font = UIFont(name: "Arial", size: 12)
        titleLabel.textColor = UIColor.white
        titleLabel.text = "Name: \(links[indexPath.item].name!) quality: \((links[indexPath.item].quality!))"
        cell.backgroundColor = UIColor.black
        cell.addSubview(titleLabel)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Select item:\(indexPath.item)")
        selectedVideo = indexPath.item
        performSegue(withIdentifier: "watchMatch", sender: Any.self)
    }
    
}
