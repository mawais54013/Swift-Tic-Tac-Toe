//
//  ViewController.swift
//  Swift Tic Tac Toe
//
//  Created by muhammad Awais on 9/21/19.
//  Copyright © 2019 muhammad Awais. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1; //Cross
    var gameState = [0,0,0,0,0,0,0,0,0]
    
    let winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var gameisActive = true;
    
    @IBOutlet weak var label: UILabel!
    
    
    @IBAction func action(_ sender: UIButton)
    {
        if(gameState[sender.tag - 1] == 0)
        {
            gameState[sender.tag-1] = activePlayer
            
            if(activePlayer == 1)
            {
                sender.setImage(UIImage(named: "x.png"), for: UIControl.State())
                activePlayer = 2;
            }
            else
            {
                sender.setImage(UIImage(named: "o.png"), for: UIControl.State())
                activePlayer = 1;
            }
        }
        
        for combination in winningCombinations {
            if(gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]])
            {
                gameisActive = false
                
                if(gameState[combination[0]] == 1)
                {
                    label.text = "Cross Won"
                }
                else
                {
                    label.text = "Circle Won"
                }
                playAgainButton.isHidden = false;
                label.isHidden = false;
            }
        }
        
        gameisActive = false;
        
        for i in gameState {
            if(i == 0)
            {
                gameisActive = true
                break;
            }
        }
        
        if gameisActive == false
        {
            label.text = "Draw"
            label.isHidden = false;
            playAgainButton.isHidden = false;
        }
    }
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: UIButton)
    {
        gameState = [0,0,0,0,0,0,0,0,0]
        gameisActive = true;
        activePlayer = 1;
        
        playAgainButton.isHidden = true
        label.isHidden = true;

        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

