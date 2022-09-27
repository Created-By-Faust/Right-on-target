//
//  ViewController.swift
//  Right on target
//
//  Created by Faust on 13.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var game: Game!

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var numberLabel: UILabel!
    
    let rounds = 5
    
    override func loadView() {
        super.loadView()
        print("load view")
    }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        game = Game(startValue: 0, endValue: 50, rounds: rounds)
        
        updateLabelWithSecret(number: game.currentSecretValue)
        
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
    
    
    // MARK: - interaction View - Model
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let numSlider = Int(slider.value)
            
        game.calculateScore(with: numSlider)
            
        if game.isGameEnded {
            showAlertWith(score: game.score)
            
            game.restartGame()
        } else {
            game.startNewRound()
        }
        updateLabelWithSecret(number: game.currentSecretValue)
    }
    
    //MARK: - update View
    
    private func updateLabelWithSecret(number: Int) {
        let newText = String(number)
        numberLabel.text = newText
    }
    
    private func showAlertWith(score: Int) {
        let alert = UIAlertController(
            title: "Game over.",
            message: "You have earned \(game.score) of 250 points.",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Start over.", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

