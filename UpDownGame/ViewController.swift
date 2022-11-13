//
//  ViewController.swift
//  UpDownGame
//
//  Created by 이원희 on 2022/11/13.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var minLabel: UILabel!
    @IBOutlet var maxLabel: UILabel!
    @IBOutlet var curValueLabel: UILabel!
    @IBOutlet var curTryLabel: UILabel!
    
    var goalValue: Int = Int.random(in: 0...30)
    var minValue: Int = 0
    var maxValue: Int = 30
    var curValue: Int = 15
    var curTry: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        slider.setThumbImage(UIImage(imageLiteralResourceName: "slider_thumb"), for: .normal)
    }

    @IBAction func checkButtonMethod(_ sender: UIButton) {
        
    }
    
    @IBAction func resetButtonMethod(_ sender: UIButton) {
        goalValue = Int.random(in: 0...30)
        minValue = 0
        maxValue = 30
        curValue = 15
        curTry = 0
        
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        minLabel.text = "\(minValue)"
        maxLabel.text = "\(maxValue)"
        curValueLabel.text = "\(curValue)"
        curTryLabel.text = "\(curTry)/5"
    }
    
}

