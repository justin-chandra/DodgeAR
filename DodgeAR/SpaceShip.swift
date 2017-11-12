//
//  Spaceship.swift
//  DodgeAR
//
//  Created by Kevin Ciampaglia on 11/11/17.
//  Copyright © 2017 Justin Chandra. All rights reserved.
//

import ARKit

class SpaceShip: SCNNode {
    
    func loadModal(){
        guard let virtualObjectScene = SCNScene(named: "art.scnassets/ship.scn") else {return}
        
        let wrapperNode = SCNNode()
        
        for child in virtualObjectScene.rootNode.childNodes{
            wrapperNode.addChildNode(child)
        }
        
        self.addChildNode(wrapperNode)
    }

}
