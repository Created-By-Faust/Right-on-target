//
//  ViewController.swift
//  Right on target
//
//  Created by Faust on 13.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var numberLabel: UILabel!
    
    lazy var secondViewController: SecondViewController = getSecondViewController()
    
    var number = 0
    var round = 1
    var points = 0
    
    override func loadView() {
        super.loadView()
        print("load view")
    }
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        number = Int.random(in: 1...50)
        numberLabel.text = String(number)
        round = 1
        
        print("view did load")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disapear")
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        
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

// functions
extension ViewController {
        
    private func getSecondViewController() -> SecondViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
        
        return viewController as! SecondViewController
    }
}
