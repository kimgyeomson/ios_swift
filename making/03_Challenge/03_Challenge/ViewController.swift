//
//  ViewController.swift
//  03_Challenge
//
//  Created by 김겸손 on 2/21/24.
//

import UIKit

class ViewController: UIViewController {
    let maxnum = 3
    var num = 1
    
    @IBOutlet var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = UIImage(named: "1.png")
    }

    @IBAction func prior(_ sender: UIButton) {
        num = num - 1
        if(num < 1) {
            num = maxnum
        }
        
        let imgNum = String(num) + ".png"
        imgView.image = UIImage(named: imgNum)
    }
    
    @IBAction func next(_ sender: UIButton) {
      num = num + 1
        if(num > maxnum) {
            num = 1
        }
        
        let imgNum = String(num) + ".png"
        imgView.image = UIImage(named: imgNum)
    }
}

