//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Moritz Nossek on 12.10.15.
//  Copyright © 2015 moritz nossek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    var playerChoice: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.playerChoice = "Scissors"
    }
    
    @IBAction private func rock(sender: UIButton!){
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
        self.playerChoice = "Rock"
        controller.playerPlay = self.playerChoice
        
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    @IBAction private func paper(sender: UIButton){
        self.playerChoice = "Paper"
        performSegueWithIdentifier("play", sender: sender)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "play"{
            let controller = segue.destinationViewController as! ResultViewController
            if self.playerChoice != "Scissors"{
            controller.playerPlay = self.playerChoice
            }else{
              controller.playerPlay = "Scissors"
            }
            
        }
    }
}

