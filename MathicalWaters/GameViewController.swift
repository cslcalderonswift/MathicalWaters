//
//  GameViewController.swift
//  MathicalWaters
//
//  Created by Sofia Swift on 12/5/19.
//  Copyright © 2019 Sofia Swift. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    var userAnswer: Int = 0
    
    @IBOutlet var textField: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    @IBOutlet weak var deleteButton: UIButton!
    @IBAction func numberButtonsPressed(_ sender: UIButton) {
        textField.text += sender.title(for: .normal)!
    }
    
    @IBAction func backspaceUserInput(_ sender: Any) {
        textField.text = ""
        
    }
    
    @IBAction func enterUserInput(_ sender: UIButton) {
        let answer: String = textField.text
        userAnswer = Int(answer) ?? 0
        textField.text = ""
        print(answer)
        GameScene.setAnswer(userAnswer: answer)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
        let scene = GameScene(size: view.bounds.size)
        let skView = view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)

    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
