//
//  ViewController.swift
//  Right on target
//
//  Created by Дмитрий Емелин on 13.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var numberLabel: UILabel!
    
    var number = 0
    var round = 0
    var points = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if round == 0 {
            number = Int.random(in: 1...50)
            numberLabel.text = String(number)
            round = 1
        } else {
            let numSlider = Int(slider.value.rounded())
            
//            switch numSlider {
//            case _ where numSlider > number: points += 50 - numSlider + number
//            case _ where numSlider < number: points += 50 + numSlider - number
//            default: points += 50
//            }
            if numSlider > number {
                points += 50 - numSlider + number
            } else if numSlider < number {
                points += 50 - number + numSlider
            } else {
                points += 50
            }
            if round == 5 {
                
                let alert = UIAlertController(title: "Game over.", message: "You have earned \(points) of 250 points.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Start over.", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                round = 1
                points = 0
            } else {
                round += 1
            }
            
            number = Int.random(in: 1...50)
            numberLabel.text = String(number)
        }
    }
    
    
    
}

