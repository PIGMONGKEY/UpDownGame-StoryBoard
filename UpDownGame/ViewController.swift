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
        reset()
    }
    
    @IBAction func sliderValueChangeMethod(_ sender: UISlider) {
        curValue = Int(sender.value)
        curValueLabel.text = "\(curValue)"
    }

    @IBAction func checkButtonMethod(_ sender: UIButton) {
        curTry += 1
        curTryLabel.text = "\(curTry)/5"
        
        if curValue == goalValue {
            showAlert("You Win!!!")
            reset()
            return
        } else if curTry >= 5 {
            showAlert("You Lose...")
            reset()
            return
        } else if curValue > goalValue {
            maxValue = curValue
            slider.maximumValue = Float(maxValue)
            maxLabel.text = "\(maxValue)"
        } else if curValue < goalValue {
            minValue = curValue
            slider.minimumValue = Float(minValue)
            minLabel.text = "\(minValue)"
        }
    }
    
    @IBAction func resetButtonMethod(_ sender: UISlider) {
        reset()
    }
    
    func reset() {
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
    
    func showAlert(_ message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in self.reset() }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
}

