//
//  ARViewModel.swift
//  Face
//
//  Created by YU WONGEUN on 2023/04/03.
//

import Foundation
import ARKit
import SwiftUI
import RealityKit

class ARViewModel: UIViewController, ObservableObject, ARSessionDelegate {
    
    @Published private var model: ARModel = ARModel()

    var arView : ARView {
        model.arView
    }
    
    var headTilt: Float {
        model.headTilt
    }
    
    var tiltLeft: Bool {
        if headTilt > 0.5 {
            return true
        } else {
            return false
        }
    }
    
    var tiltRight: Bool {
        if headTilt < -0.5 {
            return true
        } else {
            return false
        }
    }
    
    func startSessionDelegate() {
        model.arView.session.delegate = self
    }
    
    func session(_ session: ARSession, didUpdate frame: [ARAnchor]) {
        model.updateHeadTilt()
    }
}


