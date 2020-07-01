//
//  FirstConversationViewController.swift
//  Da janela
//
//  Created by Ana Carolina Soares de Melo on 16/06/20.
//  Copyright © 2020 Ana Carolina Soares de Melo. All rights reserved.
//

    import UIKit
    import SceneKit
    import ARKit

class FirstConversationViewController: UIViewController, ARSCNViewDelegate {

        @IBOutlet var sceneView: ARSCNView!
        var configuration = ARWorldTrackingConfiguration()
        var nodeKaline1 = SCNNode()
        var nodeKaline2 = SCNNode()
        var nodeKarine1 = SCNNode()
        var nodeKaline3 = SCNNode()
        var nodeKarine2 = SCNNode()
        var nodeDialogo1 = SCNNode()
        var nodeDialogo2 = SCNNode()
        var nodeDialogo3 = SCNNode()
        var nodeDialogo4 = SCNNode()
        var nodeDialogo5 = SCNNode()
        var nodeDialogo6 = SCNNode()
        var nodeDialogo7 = SCNNode()
        var nodeDialogo8 = SCNNode()
        var nodeDialogo9 = SCNNode()
        var nodeDialogo10 = SCNNode()


        

        let scene = SCNScene(named: "art.scnassets/personagens.scn")!

        @IBOutlet weak var Balao1Label: UILabel!
        @IBOutlet weak var MensagemPorta: UILabel!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Set the view's delegate
            sceneView.delegate = self
            
            // Show statistics such as fps and timing information
            sceneView.showsStatistics = true
            
            //Eixo e marcadores
            //self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints,ARSCNDebugOptions.showWorldOrigin]
            
            PodeEntrar.isHidden = true

                  
                  // Create a new scene
     sceneView.session.run(configuration)


            
        }
        
        
        // Aqui vai tudo que o botão de iniciar a visita faz
        @IBOutlet weak var BotaoPorta: UIButton!
        @IBAction func BotaoDaPorta(_ sender: Any) {
            

          configuration = ARWorldTrackingConfiguration()
            sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])

      // Create a session configuration

                    nodeKaline1 = scene.rootNode.childNode(withName: "Kaline1", recursively: false)!
                    nodeKaline2 = scene.rootNode.childNode(withName: "Kaline2", recursively: false)!
                    nodeKarine1 = scene.rootNode.childNode(withName: "Karine1", recursively: false)!
                    nodeDialogo1 = scene.rootNode.childNode(withName: "1eai", recursively: false)!
                    nodeDialogo2 = scene.rootNode.childNode(withName: "2olhaeu", recursively: false)!

            
            self.sceneView.scene.rootNode.addChildNode(nodeKaline1)
            self.sceneView.scene.rootNode.addChildNode(nodeKaline2)
            self.sceneView.scene.rootNode.addChildNode(nodeKarine1)
            self.sceneView.scene.rootNode.addChildNode(nodeDialogo1)
            self.sceneView.scene.rootNode.addChildNode(nodeDialogo2)


            
            nodeKaline2.isHidden = true
            nodeDialogo2.isHidden = true
            nodeKarine1.isHidden = true
            
            PodeEntrar.isHidden = false
            
            // Set the scene to the view
            MensagemPorta.isHidden = true
            BotaoPorta.isHidden = true

        }
        
        @IBOutlet weak var PodeEntrar: UIButton!
        @IBAction func BotaoPodeEntrar(_ sender: Any) {
            
            nodeKaline2.isHidden = false
            nodeDialogo2.isHidden = false

            nodeKarine1.isHidden = false
            nodeKaline1.isHidden = true
            nodeDialogo1.isHidden = true
            PodeEntrar.isHidden = true
            Entrem.isHidden = false

        }
        
        @IBOutlet weak var Entrem: UIButton!
        
        @IBAction func EntremBotao(_ sender: Any) {
        
            Entrem.isHidden = true
            BotãoCadeira.isHidden = false
            labelCadeira1.isHidden = false
            
        }
        
        
        @IBOutlet weak var labelCadeira1: UILabel!
        @IBOutlet weak var BotãoCadeira: UIButton!
        @IBAction func Cadeira(_ sender: Any) {
            
            configuration = ARWorldTrackingConfiguration()

            
            guard let cameraNode = sceneView.pointOfView else{return}

            let position2 = SCNVector3(x: 0.45, y: 0.5, z: -1.5)
            let position = SCNVector3(x: 0.15, y: -0.3, z: -1.5)

            
            sceneView.session.run(configuration, options: [.removeExistingAnchors])
            
            nodeKaline3 = scene.rootNode.childNode(withName: "Kaline3", recursively: true)!
            self.sceneView.scene.rootNode.addChildNode(nodeKaline3)

            nodeDialogo3 = scene.rootNode.childNode(withName: "3tudotranquilo", recursively: true)!
            self.sceneView.scene.rootNode.addChildNode(nodeDialogo3)
            
            nodeDialogo6 = scene.rootNode.childNode(withName: "6aiirma", recursively: true)!
            self.sceneView.scene.rootNode.addChildNode(nodeDialogo6)
            
            nodeDialogo8 = scene.rootNode.childNode(withName: "8eisomos", recursively: true)!
            self.sceneView.scene.rootNode.addChildNode(nodeDialogo8)
            
            nodeDialogo10 = scene.rootNode.childNode(withName: "10edepois", recursively: true)!
            self.sceneView.scene.rootNode.addChildNode(nodeDialogo10)
            
          
            updatePositionAndOrientationOf(nodeKaline3, withPosition: position, relativeTo: cameraNode)
            nodeKaline3.scale = SCNVector3(0.65, 1.3, 1)
            
            updatePositionAndOrientationOf(nodeDialogo3, withPosition: position2, relativeTo: cameraNode)
            nodeDialogo3.scale = SCNVector3(0.5, 0.25, 1)
            updatePositionAndOrientationOf(nodeDialogo6, withPosition: position2, relativeTo: cameraNode)
            nodeDialogo6.scale = SCNVector3(0.5, 0.25, 1)
            updatePositionAndOrientationOf(nodeDialogo8, withPosition: position2, relativeTo: cameraNode)
            nodeDialogo8.scale = SCNVector3(0.5, 0.25, 1)
            updatePositionAndOrientationOf(nodeDialogo10, withPosition: position2, relativeTo: cameraNode)
            nodeDialogo10.scale = SCNVector3(0.5, 0.25, 1)
            

            
            BotãoCadeira.isHidden = true
            BotãoCadeira2.isHidden = false
            
            labelCadeira2.isHidden = false
            labelCadeira1.isHidden = true
            nodeKaline2.isHidden = true
            
            
            nodeDialogo2.isHidden = true
            nodeDialogo3.isHidden = false
            nodeDialogo6.isHidden = true
            nodeDialogo8.isHidden = true
            nodeDialogo10.isHidden = true

            
        }
        
        
        @IBOutlet weak var labelCadeira2: UILabel!
        @IBOutlet weak var BotãoCadeira2: UIButton!
        @IBAction func Cadeira2(_ sender: Any) {
            
            guard let cameraNode = sceneView.pointOfView else{return}

            let position = SCNVector3(x: -0.15, y: -0.3, z: -1.5)
            let position2 = SCNVector3(x: 0.30, y: 0.5, z: -1.5)
            
            nodeKarine2 = scene.rootNode.childNode(withName: "Karine2",
                                                           recursively: false)!
            self.sceneView.scene.rootNode.addChildNode(nodeKarine2)
            
            nodeDialogo4 = scene.rootNode.childNode(withName: "4eeusoukarine",
                                                           recursively: false)!
            self.sceneView.scene.rootNode.addChildNode(nodeDialogo4)
            
            nodeDialogo5 = scene.rootNode.childNode(withName: "5nossastiaras",
                                                           recursively: false)!
            self.sceneView.scene.rootNode.addChildNode(nodeDialogo5)
            
            nodeDialogo7 = scene.rootNode.childNode(withName: "7eramesmo",
                                                           recursively: false)!
            self.sceneView.scene.rootNode.addChildNode(nodeDialogo7)
            
            nodeDialogo9 = scene.rootNode.childNode(withName: "9elaetoda",
                                                           recursively: false)!
            self.sceneView.scene.rootNode.addChildNode(nodeDialogo9)
            
            
            updatePositionAndOrientationOf(nodeKarine2, withPosition: position, relativeTo: cameraNode)
            nodeKarine2.scale = SCNVector3(-1.1, 1.3, 1)

            updatePositionAndOrientationOf(nodeDialogo4, withPosition: position2, relativeTo: cameraNode)
            nodeDialogo4.scale = SCNVector3(0.5, 0.25, 1)
            
            updatePositionAndOrientationOf(nodeDialogo5, withPosition: position2, relativeTo: cameraNode)
            nodeDialogo5.scale = SCNVector3(0.5, 0.25, 1)
            
            updatePositionAndOrientationOf(nodeDialogo7, withPosition: position2, relativeTo: cameraNode)
            nodeDialogo7.scale = SCNVector3(0.5, 0.25, 1)
            
            updatePositionAndOrientationOf(nodeDialogo9, withPosition: position2, relativeTo: cameraNode)
            nodeDialogo9.scale = SCNVector3(0.5, 0.25, 1)
            

            
            BotãoCadeira2.isHidden = true
            labelCadeira2.isHidden = true
            nodeKarine1.isHidden = true
            
            
            nodeDialogo5.isHidden = true
            nodeDialogo7.isHidden = true
            nodeDialogo9.isHidden = true

            BotaoOque.isHidden = false
            
            

            
        }
    
    @IBOutlet weak var BotaoOque: UIButton!
    
    @IBAction func Oque(_ sender: Any) {
        
        nodeDialogo5.isHidden = false
        nodeDialogo3.isHidden = true
        nodeDialogo4.isHidden = true


        BotaoOque.isHidden = true
        BotaoQuelegal.isHidden = false


    }
    
    
    @IBOutlet weak var BotaoQuelegal: UIButton!
    @IBAction func Quelegal(_ sender: Any) {
        
        nodeDialogo5.isHidden = true
        nodeDialogo6.isHidden = false
        nodeDialogo7.isHidden = false
        
        BotaoQuelegal.isHidden = true
        BotaoTresTiaras.isHidden = false
        
    }
    
    @IBOutlet weak var BotaoTresTiaras: UIButton!
    
    @IBAction func Trestiaras(_ sender: Any) {
        
        
        nodeDialogo6.isHidden = true
        nodeDialogo7.isHidden = true
        nodeDialogo8.isHidden = false
        nodeDialogo9.isHidden = false
        
        BotaoTresTiaras.isHidden = true
        BotaoAmei.isHidden = false

    }
    
    @IBOutlet weak var BotaoAmei: UIButton!
    @IBAction func Ameiaideia(_ sender: Any) {
        
        
        nodeDialogo8.isHidden = true
        nodeDialogo9.isHidden = true
        nodeDialogo10.isHidden = false
        
        BotaoAmei.isHidden = true
        BotaoEuque.isHidden = false
    }
    
    @IBOutlet weak var BotaoEuque: UIButton!
    @IBAction func Euqueagradeco(_ sender: Any) {
        
        nodeDialogo10.isHidden = true
        
        UIApplication.shared.open(NSURL(string: "https://www.instagram.com/ar/298654667934655")! as URL)
        
        BotaoEuque.isHidden = true
        
        // a parada do user defaults
        
        
        
    }
    
    
    // Não mexer daqui pra baixo
    
        func updatePositionAndOrientationOf(_ node: SCNNode, withPosition position: SCNVector3, relativeTo referenceNode: SCNNode) {
            let referenceNodeTransform = matrix_float4x4(referenceNode.transform)

            // Setup a translation matrix with the desired position
            var translationMatrix = matrix_identity_float4x4
            translationMatrix.columns.3.x = position.x
            translationMatrix.columns.3.y = position.y
            translationMatrix.columns.3.z = position.z

            // Combine the configured translation matrix with the referenceNode's transform to get the desired position AND orientation
            let updatedTransform = matrix_multiply(referenceNodeTransform, translationMatrix)
            node.transform = SCNMatrix4(updatedTransform)
        }
        
        
        override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)


            

        }
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            
            // Pause the view's session
            sceneView.session.pause()
        }


        
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
