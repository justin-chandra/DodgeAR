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
        var i = 0
        while i < 100 {
            i += 1
            addObject()
        }
//        addObject()
    }
    
    
    
    func addObject(){
        let ship = SpaceShip()
        ship.loadModal()
        let xPos = randomPosition(lowerBound: -5.5, upperBound: 5)
        let yPos = randomPosition(lowerBound: -2, upperBound: 2)
        let zPos = randomPosition(lowerBound: -10, upperBound: 0)
        ship.position = SCNVector3(xPos,yPos, zPos)
        ship.moveToward()
        sceneView.scene.rootNode.addChildNode(ship)
    }
    
    func randomPosition (lowerBound lower:Float, upperBound upper:Float) -> Float {
        return Float(arc4random()) / Float(UInt32.max) * (lower - upper) + upper
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        addObject()
        
        /*if let touch = touches.first{
            let location = touch.location(in: sceneView)
            //print(location)
            let hitList = sceneView.hitTest(location, options: nil)
            if let hitObject = hitList.first{
                let node = hitObject.node
                //print(node)
                if (node.name == "shipMesh"){
                    node.removeFromParentNode()
                }
                
            }
        }
 */
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
