//
//  ViewController.swift
//  Prac2
//
//  Created by Tianhao Zhang on 14/3/18.
//  Copyright © 2018 Tianhao Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var counter : Int = 0
    @IBOutlet weak var touchCounter: UILabel!
    
    @IBAction func LightOnOff(_ sender: UIButton) {
        
        counter += 1
        touchCounter.text = "\(counter) clicks"
        //tag property is usually used to set a custom attribute of the object
        //It denoends on what you wnat to do
        //here I'm using it as a flag to know which image is loaded
        
        if sender.tag == 0{
            sender.setImage(UIImage(named: "LightOn"),
                            for: .normal)
            sender.tag = 1
        }
        else {
            sender.setImage(UIImage(named: "LightOff"), for: .normal)
            sender.tag = 0
        }
    }
    

    
}

