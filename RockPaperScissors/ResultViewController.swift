//
//  ResultViewController.swift
//  RockPaperScissors
//
//  Created by Moritz Nossek on 12.10.15.
//  Copyright © 2015 moritz nossek. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var playAgainButton: UIButton!
    
    var opponentPlay: String!
    var playerPlay: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.opponentPlay = randomOpponentPlay()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        displayView()
    }
    
    private func randomOpponentPlay() -> String{
        let result = Int(1 + arc4random() % 3)
        
        switch result{
        case 1: return "Rock"
        case 2: return "Paper"
        case 3: return "Scissors"
        default: return "No random opponent play."
        }
    }
    
    private func comparePlays() -> String{
        switch (self.playerPlay, self.opponentPlay){
        case ("Rock", "Rock"): return "It's a Tie."
        case ("Rock", "Paper"): return "Paper covers Rock. You loose."
        case ("Rock", "Scissors"): return "Rock crushes Scissors. You win."
        case ("Paper", "Paper"): return "It's a Tie."
        case ("Paper", "Rock"): return "Paper covers Rock. You win."
        case ("Paper", "Scissors"): return "Scissors cut Paper. You loose."
        case ("Scissors", "Scissors"): return "It's a Tie."
        case ("Scissors", "Rock"): return "Rock crushes Scissors. You loose."
        case ("Scissors", "Paper"): return "Scissors cut Paper. You win."
        default: return "Couldn't compare plays."
        }
    }
    
    func displayView(){
        let result = comparePlays()
        
        self.resultLabel.text = result
        
        switch result{
            case "It's a Tie.": self.imageView.image = UIImage(named: "itsATie")
            case "Paper covers Rock. You loose.", "Paper covers Rock. You win.":
            self.imageView.image = UIImage(named: "PaperCoversRock")
            case "Rock crushes Scissors. You win.", "Rock crushes Scissors. You loose.":
            self.imageView.image = UIImage(named: "RockCrushesScissors")
        default: self.imageView.image = UIImage(named: "ScissorsCutPaper")
        }
    }
    
    @IBAction func playAgain(sender: UIButton!){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}