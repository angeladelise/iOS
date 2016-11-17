//
//  ViewController.swift
//  Gif_Maker2
//
//  Created by Angela Delise on 11/15/16.
//  Copyright © 2016 Angela Delise. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,
    UIImagePickerControllerDelegate,
    UINavigationControllerDelegate
{


    @IBOutlet weak var cameraView: UIView!
    
    var captureSession = AVCaptureSession()
    var sessionOutput = AVCapturePhotoOutput()
    var previewLayer = AVCaptureVideoPreviewLayer()
    
    override func viewWillAppear(_ animated: Bool) {
        let devices = AVCaptureDeviceDiscoverySession.init(deviceTypes: AVMediaType, mediaType: String!, position: <#T##AVCaptureDevicePosition#>)
            
            .devices(withMediaType: AVMediaTypeVideo)
        
        for device in devices! {
            if (device as AnyObject).position == AVCaptureDevicePosition.front{
            
                do{
                    let input = try AVCaptureDeviceInput(device: device as! AVCaptureDevice)
                    
                    if captureSession.canAddInput(input){
                        captureSession.addInput(input)
                        sessionOutput.capturePhoto(with: AVVideoCodecKey, delegate: AVVideoCodecJPEG)
                        
                        //outputSettings = [AVVideoCodecKey: AVVideoCodecJPEG]
                        
                        if captureSession.canAddOutput(sessionOutput){
                            captureSession.addOutput(sessionOutput)
                            previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                            previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
                            previewLayer.connection.videoOrientation = AVCaptureVideoOrientation.portrait
                            cameraView.layer.addSublayer(previewLayer)
                            
                        }
                    }
                }
                
                catch{
                    print("Error")
                }
            }
        }
    }

    @IBAction func takePhoto(_ sender: UIButton) {
    }

}

