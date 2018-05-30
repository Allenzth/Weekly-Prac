//
//  ViewController.swift
//  Prac3
//
//  Created by Tianhao Zhang on 20/3/18.
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
    
    var imgs : [UIImage] = [
        UIImage(named: "Cross")!,
        UIImage(named: "monkey")!,
        UIImage(named: "Cool")!,
        UIImage(named: "smiley")!,
        UIImage(named: "Nought")!
        ]
    
    var lastButton : UIButton?
    // one simple way to set tags if you don't understand the random number
    
    
    @IBOutlet weak var score: UILabel!
    @IBAction func buttonTouched(_ sender: UIButton) {
        if sender.tag == -1 {return}
        sender.setImage(imgs[sender.tag], for: .normal)
        if lastButton == nil {
            lastButton = sender
        }
        else if lastButton != nil &&
            sender.tag == lastButton!.tag{
            score.text = "\(Int(score.text!)! + 1)"
            sender.tag = -1
            lastButton!.tag = -1
            lastButton = nil
        }
        else{
            sender.setImage(imgs[0], for: .normal)
            lastButton!.setImage(imgs[0], for: .normal)
            lastButton = nil}}
    
    @IBOutlet var buttons: [UIButton]!

    
    @IBAction func reset(_ sender: UIButton) {
        score.text = "0"
        
        //generate an arry of nums with values from zero to munber of buttons
        var nums = Array(0..<buttons.count)
        
        //loop on the arry as long as it still has some numbers to choose from
        while  nums.count > 0 {
            
            var i = Int(arc4random_uniform(UInt32(nums.count)))
            var j = Int(arc4random_uniform(UInt32(nums.count)))
            
            if i != j{
                
                if i > j {
                    i = nums.remove(at: i)
                    j = nums.remove(at: j)
                }
                else{
                    j = nums.remove(at: j)
                    i = nums.remove(at: i)
                }
                let random = Int(arc4random_uniform(UInt32(imgs.count - 1)) + 1)
                
                buttons[i].tag = random
                buttons[j].tag = random
                
                buttons[i].setImage(imgs[0], for: .normal)
                buttons[j].setImage(imgs[0], for: .normal)
            }
        }
    }
    
}

