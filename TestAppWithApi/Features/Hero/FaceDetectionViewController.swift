//
//  FaceDetectionViewController.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 10.03.2021.
//

import UIKit
import FirebaseMLVision

class FaceDetectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func setupFaceDetection() {
        let options = VisionFaceDetectorOptions()
        options.performanceMode = .accurate
        options.landmarkMode = .all
        options.classificationMode = .all
        
       
    }
    
}
