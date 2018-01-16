/*
See LICENSE folder for this sample’s licensing information.

Abstract:
An `SCNNode` subclass demonstrating a basic use of `ARSCNFaceGeometry`.
*/

import ARKit
import SceneKit

class Mask: SCNNode, VirtualFaceContent {
    
    var geometry2: SCNPlane
    init(geometry: ARSCNFaceGeometry) {
        let material = geometry.firstMaterial!
      
        
        material.diffuse.contents = UIColor.green // UIColor.lightGray
        material.lightingModel = .physicallyBased
        material.transparency = 1
        //material.colorBufferWriteMask = SCNColorMask(rawValue : 100)
        material.isLitPerPixel = true
        geometry2 = SCNPlane(width: 1, height: 1)
        
        
        super.init()
        self.geometry = geometry
        self.position = SCNVector3(0.0, 0.2, 0)
        
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("\(#function) has not been implemented")
    }
    
    // MARK: VirtualFaceContent
    
    /// - Tag: SCNFaceGeometryUpdate
    func update(withFaceAnchor anchor: ARFaceAnchor) {
        let faceGeometry = geometry as! ARSCNFaceGeometry
        faceGeometry.update(from: anchor.geometry)
        
    }
}
