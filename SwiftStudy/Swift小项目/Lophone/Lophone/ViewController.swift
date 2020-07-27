//
//  ViewController.swift
//  Lophone
//
//  Created by zainguo on 2019/5/21.
//  Copyright © 2019 zainguo. All rights reserved.
//

import UIKit

import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func play(_ index: Int) {
        let url = Bundle.main.url(forResource: "note\(index)", withExtension: "wav")
        
        do {
            player = try AVAudioPlayer(contentsOf: url!)
            player.play()
        } catch {
            print(error)
            
        }
    }
    @IBAction func notePressed(_ sender: UIButton) {
        
        let index = sender.tag
        play(index)
        
        
    }
    
}

