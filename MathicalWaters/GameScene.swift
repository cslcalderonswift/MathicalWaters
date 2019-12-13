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
    var equations:[String: Int] =
    ["7 + 3": 10,
     "9 + 2": 11,
    "6 + 18": 24,
    "15 + 15": 30,
    "3 + 2": 6,
    "6 + 8": 14,
    "32 + 35": 67,
    "6 + 7": 13,
    "60 + 30": 90,
    "22 + 21": 43,
    "8 + 4": 12,
    "22 + 32": 54,
    "5 + 100": 105,
    "8 + 7": 15,
    "44 + 45": 89,
    "3 + 14": 17,
    "29 + 43": 72,
    "7 + 7": 14,
    "7 + 14": 21,
    "10 + 18": 38]
    // 1
           let boat = SKSpriteNode(imageNamed: "Boat")
             
           override func didMove(to view: SKView) {
             // 2
             backgroundColor = UIColor(red: 0.56, green: 0.99, blue: 1, alpha: 1)
             // 3
             boat.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
             // 4
             addChild(boat)
            run(SKAction.repeatForever(
              SKAction.sequence([
                SKAction.run(addRain),
                SKAction.wait(forDuration: 1.0)
                ])
            ))

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
    
    
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let label = self.label {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    func random() -> CGFloat {
      return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }

    func random(min: CGFloat, max: CGFloat) -> CGFloat {
      return random() * (max - min) + min
    }

    func addRain() {
      
      // Create sprite
        for (eq, _) in equations {
            let rain = SKLabelNode(fontNamed: "Damascus")
            rain.text = eq
            rain.fontColor = .black
            rain.fontSize = 11
            let y = random(min: size.height + 1, max: size.height + rain.fontSize)
            rain.position = CGPoint(x: size.width/2, y: y)
            addChild(rain)
            let actualDuration = random(min: CGFloat(2.0), max: CGFloat(4.0))
            let actionMove = SKAction.move(to: CGPoint(x: size.width/2, y: boat.position.y + boat.size.height),
                                           duration: TimeInterval(actualDuration))
            let actionMoveDone = SKAction.removeFromParent()
            rain.run(SKAction.sequence([actionMove, actionMoveDone]))
        }
      //let rain = SKSpriteNode(imageNamed: "monster")
      
      
    }

}
