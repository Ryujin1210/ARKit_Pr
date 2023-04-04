//
//  ARModel.swift
//  Face
//
//  Created by YU WONGEUN on 2023/04/03.
//

import Foundation
import RealityKit
import ARKit

// MARK: - Adding Face Tracking
struct ARModel {
    
    private(set) var arView: ARView
    
    var headTilt: Float = 0
    
    init() {
        arView = ARView(frame: .zero)
        arView.session.run(ARFaceTrackingConfiguration())
        
        let faceAnchor = AnchorEntity(.face)
        faceAnchor.name = "faceAnchor"
        arView.scene.addAnchor(faceAnchor)
        
        let cameraAnchor = AnchorEntity(.camera)
        cameraAnchor.name = "cameraAnchor"
        arView.scene.addAnchor(cameraAnchor)
    }
    
    mutating func updateHeadTilt() {
        
        let faceAnchor = arView.scene.anchors.first(where: {$0.name == "faceAnchor"})
        let cameraAnchor = arView.scene.anchors.first(where: {$0.name == "cameraAnchor"})
        
        headTilt = faceAnchor?.orientation(relativeTo: cameraAnchor).axis.z ?? 0
        
    }
    
}

// MARK: - Tracking the orientation of the user's head

