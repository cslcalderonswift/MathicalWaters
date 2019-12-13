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
    var equations =
       [["7 + 3": 10], ["9 + 2": 11],
       ["6 + 18": 24],
       ["15 + 15": 30],
       ["3 + 2": 6],
       ["6 + 8": 14],
       ["32 + 35": 67],
       ["6 + 7": 13],
       ["60 + 30": 90],
       ["22 + 21": 43],
       ["8 + 4": 12],
       ["22 + 32": 54],
       ["5 + 100": 105],
       ["8 + 7": 15],
       ["44 + 45": 89],
       ["3 + 14": 17],
       ["29 + 43": 72],
       ["7 + 7": 14],
       ["7 + 14": 21],
       ["10 + 18": 38]]

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
