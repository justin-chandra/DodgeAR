//
//  Spaceship.swift
//  DodgeAR
//
//  Created by Kevin Ciampaglia on 11/11/17.
//  Copyright © 2017 Justin Chandra. All rights reserved.
//

import ARKit

class SpaceShip: SCNNode {
    var age = 0.0
    func loadModal(){
        guard let virtualObjectScene = SCNScene(named: "art.scnassets/ship.scn") else {return}
        
        let wrapperNode = SCNNode()
        
        for child in virtualObjectScene.rootNode.childNodes{
            wrapperNode.addChildNode(child)
        }
        self.addChildNode(wrapperNode)
    }
    
    func moveToward(){
        let move = SCNAction.moveBy(x: 0, y: 0, z: 60, duration: 30)
        
        let seq:SCNAction = SCNAction.sequence([move]);
        let repeatForever: SCNAction = SCNAction.repeatForever(seq)
        self.runAction(repeatForever)
    }

}
