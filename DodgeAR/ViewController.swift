//
//  ViewController.swift
//  DodgeAR
//
//  Created by Justin Chandra on 11/11/17.
//  Copyright © 2017 Justin Chandra. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    var counter:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
        
        var i = 0;
        while(i < 10){
            addObject()
            i = i + 1
        }
    }
    
    func addObject(){
        let ship = SpaceShip()
        ship.loadModal()
        let xPos = randomPosition(lowerBound: -2, upperBound: 2)
        let yPos = randomPosition(lowerBound: -1, upperBound: 1)
        let zPos = randomPosition(lowerBound: -10, upperBound: -5)
        ship.position = SCNVector3(xPos,yPos, zPos)
        ship.moveToward()
        sceneView.scene.rootNode.addChildNode(ship)
    }
    
    func randomPosition (lowerBound lower:Float, upperBound upper:Float) -> Float {
        return Float(arc4random()) / Float(UInt32.max) * (lower - upper) + upper
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            let location = touch.location(in: sceneView)
            //print(location)
            let hitList = sceneView.hitTest(location, options: nil)
            if let hitObject = hitList.first{
                let node = hitObject.node
                //print(node)
                if (node.name == "shipMesh"){
                    node.removeFromParentNode()
                    addObject()
                    addObject()
                    counter+=1
                    print(counter)
                }
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {}
    
    func sessionWasInterrupted(_ session: ARSession) {}
    
    func sessionInterruptionEnded(_ session: ARSession) {}
}
