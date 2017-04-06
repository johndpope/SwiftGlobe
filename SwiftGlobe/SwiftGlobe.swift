//
//  SwiftGlobe.swift
//  SwiftGlobe
//
//  Created by David Mojdehi on 4/6/17.
//  Copyright © 2017 Mindful Bear Apps. All rights reserved.
//

import Foundation

import SceneKit

let kGlobeRadius = CGFloat(5.0)

class SwiftGlobe {
    
    
    var scene = SCNScene()
    var camera = SCNCamera()
    var cameraNode = SCNNode()
    var globe = SCNNode()

    init() {
        // make the globe
        let globeShape = SCNSphere(radius: kGlobeRadius)
        globeShape.segmentCount = 30
        globeShape.firstMaterial!.diffuse.contents = "earth-diffuse.jpg"
        globeShape.firstMaterial!.specular.contents = "earth-specular.jpg"
        globeShape.firstMaterial!.specular.intensity = 0.2
        globeShape.firstMaterial!.shininess = 0.1
        globeShape.firstMaterial!.reflective.contents = "envmap.jpg"
        globeShape.firstMaterial!.reflective.intensity = 0.5
        globeShape.firstMaterial!.fresnelExponent = 2
        
        
        
        globe.geometry = globeShape
        scene.rootNode.addChildNode(globe)
        
        // create and add a camera to the scene
        // configure the camera itself
        camera.usesOrthographicProjection = true
        camera.orthographicScale = 9
        camera.zNear = 0
        camera.zFar = 100
        // its node (so it can live in the scene)
        cameraNode.position = SCNVector3(x: 0, y: 0, z:  kGlobeRadius * CGFloat(2.0) )
        cameraNode.camera = camera
        scene.rootNode.addChildNode(cameraNode)
    
    }
    
    
}
