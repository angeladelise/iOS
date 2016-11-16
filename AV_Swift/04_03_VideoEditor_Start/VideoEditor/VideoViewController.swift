//
//  VideoViewController.swift
//  VideoEditor
//
//  Created by Ron Buencamino on 9/1/16.
//  Copyright © 2016 Roux Academy. All rights reserved.
//

import UIKit
import AVFoundation
import CoreMedia

class VideoViewController: UIViewController {
    
    @IBOutlet weak var previewView:UIView!
    @IBOutlet weak var recordButton:UIButton!
    @IBOutlet weak var toggleButton:UIButton!
    

    let captureSession = AVCaptureSession()
    var videoCaptureDevice:AVCaptureDevice?
    var previewLayer:AVCaptureVideoPreviewLayer?
    var movieFileOutput = AVCaptureMovieFileOutput()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.initializeCamera()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillLayoutSubviews() {
        self.setVideoOrientation()
    }

    
    // MARK: Button Actions
    @IBAction func recordVideoButtonPressed(sender:AnyObject) {
        
    }
    
    @IBAction func cameraTogglePressed(sender:AnyObject) {

    }
    
    // MARK: Main
    
    func initializeCamera(){
        
        self.captureSession.sessionPreset = AVCaptureSessionPresetHigh
        let discovery = AVCaptureDeviceDiscoverySession.init(deviceTypes: [AVCaptureDeviceType.builtInWideAngleCamera], mediaType: AVMediaTypeVideo, position: .unspecified) as AVCaptureDeviceDiscoverySession
        
        for device in discovery.devices as [AVCaptureDevice] {
            
            if device.hasMediaType(AVMediaTypeVideo) {
                if device.position == AVCaptureDevicePosition.back {
                    self.videoCaptureDevice = device
                }
            }
            
        }
        
        if videoCaptureDevice != nil {
            do {
                try self.captureSession.addInput(AVCaptureDeviceInput(device: self.videoCaptureDevice))
                
                if let audioInput = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeAudio) {
                    try self.captureSession.addInput(AVCaptureDeviceInput(device: audioInput))
                }
                
                self.previewLayer = AVCaptureVideoPreviewLayer(session: self.captureSession)
                
                self.previewView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
                
                self.previewView.layer.addSublayer(self.previewLayer!)
                self.previewLayer?.frame = self.previewView.frame
                
                self.setVideoOrientation()
                
                self.captureSession.addOutput(self.movieFileOutput)
                
                self.captureSession.startRunning()
                
            } catch {
                print(error)
            }
        }
        
    }
    
    func setVideoOrientation() {
        if let connection = self.previewLayer?.connection {
            if connection.isVideoOrientationSupported {
                connection.videoOrientation = self.videoOrientation()
                self.previewLayer?.frame = self.view.bounds
            }
        }
    }

    
    // MARK: Helpers
    
    func videoOrientation() -> AVCaptureVideoOrientation {
        
        var videoOrientation:AVCaptureVideoOrientation!
        
        let orientation:UIDeviceOrientation = UIDevice.current.orientation
        
        switch orientation {
        case .portrait:
            videoOrientation = .portrait
        case .landscapeRight:
            videoOrientation = .landscapeLeft
        case .landscapeLeft:
            videoOrientation = .landscapeRight
        case .portraitUpsideDown:
            videoOrientation = .portraitUpsideDown
        default:
            videoOrientation = .portrait
        }
        
        return videoOrientation
        
    }
    
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
