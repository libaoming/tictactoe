//
//  ViewController.swift
//  TicTacToe
//
//  Created by 李宝明 on 16/8/24.
//  Copyright © 2016年 李宝明. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var replayButton: UIButton!
    var isActivePlayer = 1
    
    var activeGame = true
    
    var isLose = false
    
    var gameState = [0,0,0,0,0,0,0,0,0]
    
    let winningCombination = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

   
    @IBOutlet weak var winningLabel: UILabel!
    
    @IBAction func onBtnPressed(_ sender: AnyObject) {
        
        if  activeGame {
            
            let  btnPosition = sender.tag - 1
            
            if gameState[btnPosition] == 0 {
                
                if isActivePlayer == 1 {
                    sender.setImage(UIImage(named: "nought.png"),for: [])
                    isActivePlayer = 2
                    gameState[btnPosition] = 1
                    print(gameState)
                }else {
                    sender.setImage(UIImage(named: "cross.png"),for: [])
                    isActivePlayer = 1
                    gameState[btnPosition] = 2
                    print(gameState)
                    
                }
                
            }
            
            
          
             
            for combination in winningCombination {
                    
                    if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                        
                        gameOver(state: gameState[combination[0]])
                        
                    }
                }

            
            
            if activeGame && gameState[0] != 0 && gameState[1] != 0 && gameState[2] != 0  && gameState[3] != 0 && gameState[4] != 0 && gameState[5] != 0 && gameState[6] != 0  && gameState[7] != 0 && gameState[8] != 0   {
                    
                    gameOver(state: 0)
            }
            
            
        }
        
        
    }
    
    
    func gameOver(state: Int){
        
        activeGame = false
        
        winningLabel.isHidden = false
        replayButton.isHidden = false
        
        if state == 1 {
            winningLabel.text = "noughts has win "
        }else if state == 2 {
            winningLabel.text = "cross has win "
        }else {
            winningLabel.text = "you are failed ...."
        }
        
        UIView.animate(withDuration: 1, animations: {
            self.winningLabel.center = CGPoint(x: self.winningLabel.center.x
                + 500, y: self.winningLabel.center.y)
            
            self.replayButton.center = CGPoint(x: self.replayButton.center.x + 500, y: self.replayButton.center.y)
        })

    }
    
    @IBAction func replayBtnPressed(_ sender: AnyObject) {
        
        activeGame = true
        gameState = [0,0,0,0,0,0,0,0,0]
        isActivePlayer = 1
        
        var button: UIButton
        
        for i in  1..<10 {
            
            if let btn = view.viewWithTag(i) as? UIButton {
                
                    button = btn
                    button.setImage(nil, for: [])
            }
            
        }
        
        
        winningLabel.isHidden = true
        replayButton.isHidden = true
        winningLabel.center = CGPoint(x: winningLabel.center.x - 500, y: winningLabel.center.y)
        replayButton.center = CGPoint(x: replayButton.center.x - 500, y: replayButton.center.y)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winningLabel.isHidden = true
        replayButton.isHidden = true
        winningLabel.center = CGPoint(x: winningLabel.center.x - 500, y: winningLabel.center.y)
        replayButton.center = CGPoint(x: replayButton.center.x - 500, y: replayButton.center.y)

    }



}

