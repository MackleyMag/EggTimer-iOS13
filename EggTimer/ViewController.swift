//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    var totalTime = 0
    var secondsPassed = 0
    
    var timer = Timer()

    @IBAction func hardnessSelected(_ sender: UIButton) {
        progressBar.progress = 0.0
        secondsPassed = 0
        timer.invalidate()
        
        
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        titleLabel.text = "Doing some progress to \(hardness)..."
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if secondsPassed < totalTime{
            
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            secondsPassed += 1
            
            progressBar.progress = percentageProgress
        }else{
            timer.invalidate()
            progressBar.progress = 1.0
            titleLabel.text = "Done!"
        }
    }
    
}
