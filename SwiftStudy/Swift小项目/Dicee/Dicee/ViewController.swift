//
//  ViewController.swift
//  Dicee
//
//  Created by zainguo on 2019/5/20.
//  Copyright © 2019 zainguo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let dataArr = ["dice1","dice2","dice3","dice4","dice5","dice6"]
    var index1 = 0
    var index2 = 0
    
    @IBOutlet weak var imgView1: UIImageView!
    @IBOutlet weak var  imgView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDiceImages()
    }
    @IBAction func rollAction(_ sender: Any) {
        updateDiceImages()
    }
    
    /// 摇一摇
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateDiceImages()
    }
    
    func updateDiceImages() {
        index1 = Int.random(in: 0...5)
        index2 = Int.random(in: 0...5)
        imgView1.image = UIImage(named: dataArr[index1])
        imgView2.image = UIImage(named: dataArr[index2])
    }

}

