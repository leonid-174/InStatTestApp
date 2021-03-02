//
//  WatchController.swift
//  inStatTestApp
//
//  Created by Leonid Vilner on 28/02/2021.
//  Copyright © 2021 Andrey Vilner. All rights reserved.
//

import UIKit
import AVKit

class WatchController: UIViewController {

    var videoURL = ""
    
    let playerController = AVPlayerViewController()
    
    @IBAction func backPress(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: videoURL)
        let player = AVPlayer(url: url!)
        
        playerController.player = player
        self.addChild(playerController)
        self.view.addSubview(playerController.view)
        playerController.view.frame = CGRect(x: 0, y: 60, width: view.frame.width, height: view.frame.height - 60)
        playerController.showsPlaybackControls = true
        
        player.play()
        
        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
