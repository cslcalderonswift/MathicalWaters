//
//  GameScene.swift
//  MathicalWaters
//
//  Created by Sofia Swift on 12/5/19.
//  Copyright © 2019 Sofia Swift. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    var won = true
    // 1
           let boat = SKSpriteNode(imageNamed: "Boat")
             
           override func didMove(to view: SKView) {
             // 2
            backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
             // 3
             boat.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
             // 4
             addChild(boat)
            
            
            
            if !won {
                let gameOverScene = FinishScreen(size: self.size, won: false)
                self.view?.presentScene(gameOverScene)
            }
            
           }
    /*override func didMove(to view: SKView) {
        
        // Get label node from scene and store it for use later
        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
        if let label = self.label {
            label.alpha = 0.0
            label.run(SKAction.fadeIn(withDuration: 2.0))
        }
        
        // Create shape node to use during mouse interaction
        let w = (self.size.width + self.size.height) * 0.05
        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
        
        if let spinnyNode = self.spinnyNode {
            spinnyNode.lineWidth = 2.5
            
            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                              SKAction.fadeOut(withDuration: 0.5),
                                              SKAction.removeFromParent()]))
        }
    }*/
    
    

    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
