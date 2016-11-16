//
//  ExportViewController.swift
//  VideoEditor
//
//  Created by Ron Buencamino on 9/1/16.
//  Copyright © 2016 Roux Academy. All rights reserved.
//

import UIKit
import AVFoundation
import Photos

class ExportViewController: UIViewController, MediaCollectionDelegateProtocol {
    
    @IBOutlet weak var exportButton:UIButton!
    
    var assets = [PHAsset]()
    var fileUrl:URL?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Main
    func exportWithWatermark() {
        let composition = AVMutableComposition()
        let asset = AVURLAsset(url: self.fileUrl!, options: nil)
        
        let track =  asset.tracks(withMediaType: AVMediaTypeVideo)
        let videoTrack:AVAssetTrack = track[0] as AVAssetTrack
        let timerange = CMTimeRangeMake(kCMTimeZero, asset.duration)
        
        let compositionVideoTrack:AVMutableCompositionTrack = composition.addMutableTrack(withMediaType: AVMediaTypeVideo, preferredTrackID: CMPersistentTrackID())
        
        do {
            try compositionVideoTrack.insertTimeRange(timerange, of: videoTrack, at: kCMTimeZero)
            compositionVideoTrack.preferredTransform = videoTrack.preferredTransform
        } catch {
            print(error)
        }
        
        let compositionAudioTrack:AVMutableCompositionTrack = composition.addMutableTrack(withMediaType: AVMediaTypeAudio, preferredTrackID: CMPersistentTrackID())
        
        for audioTrack in asset.tracks(withMediaType: AVMediaTypeAudio) {
            do {
                try compositionAudioTrack.insertTimeRange(audioTrack.timeRange, of: audioTrack, at: kCMTimeZero)
            } catch {
                print(error)
            }
            
        }
        
        let size = videoTrack.naturalSize
        
        let watermark = UIImage(named: "watermark.png")
        let watermarklayer = CALayer()
        watermarklayer.contents = watermark?.cgImage
        watermarklayer.frame = CGRect(x: 10, y: 10, width: 180, height: 180)
        watermarklayer.opacity = 0.5
        
        let textLayer = CATextLayer()
        textLayer.string = "My Movie"
        textLayer.font = UIFont(name: "Helvetica", size: 35)
        textLayer.shadowOpacity = 0.5
        textLayer.alignmentMode = kCAAlignmentCenter
        textLayer.frame = CGRect(x: 0, y:50, width: size.width, height: size.height / 6)
        
        let videolayer = CALayer()
        videolayer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        let parentlayer = CALayer()
        parentlayer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        parentlayer.addSublayer(videolayer)
        parentlayer.addSublayer(watermarklayer)
        parentlayer.addSublayer(textLayer)
        
        let layercomposition = AVMutableVideoComposition()
        layercomposition.frameDuration = CMTimeMake(1, 30)
        layercomposition.renderSize = size
        layercomposition.animationTool = AVVideoCompositionCoreAnimationTool(postProcessingAsVideoLayer: videolayer, in: parentlayer)
        
        let instruction = AVMutableVideoCompositionInstruction()
        instruction.timeRange = CMTimeRangeMake(kCMTimeZero, composition.duration)
        let videotrack = composition.tracks(withMediaType: AVMediaTypeVideo)[0] as AVAssetTrack
        let layerinstruction = AVMutableVideoCompositionLayerInstruction(assetTrack: videotrack)
        instruction.layerInstructions = [layerinstruction]
        layercomposition.instructions = [instruction]
        
        let filePath = NSTemporaryDirectory() + self.fileName()
        let movieUrl = URL(fileURLWithPath: filePath)
        
        
        guard let assetExport = AVAssetExportSession(asset: composition, presetName:AVAssetExportPresetHighestQuality) else {return}
        assetExport.videoComposition = layercomposition
        assetExport.outputFileType = AVFileTypeMPEG4
        assetExport.outputURL = movieUrl
        assetExport.exportAsynchronously(completionHandler: {
            switch assetExport.status {
            case .completed:
                print("success")
                self.presentShareViewForFileAtUrl(url: movieUrl)
                break
            case .cancelled:
                print("cancelled")
                break
            case .exporting:
                print("exporting")
                break
            case .failed:
                print("failed: \(assetExport.error)")
                break
            case .unknown:
                print("unknown")
                break
            case .waiting:
                print("waiting")
                break
            }
        })
    }
    
    @IBAction func selectButtonPressed(sender:AnyObject) {
        self.fetchAsset()
    }
    
    @IBAction func exportButtonPressed(sender:AnyObject) {
        self.exportWithWatermark()
    }
    
    func mediaSelected(selectedAssets:[String:PHAsset]){
        if let asset = selectedAssets["asset"] {
            PhotoManager().fetchAVAssetForPHAsset(videoAsset: asset, completion: { (success, url) in
                //
                if success {
                    self.fileUrl = url
                }
            })
        }
        
        self.exportButton.isHidden = false
    }
    
    // MARK: Helpers
    
    func fileName() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMddyyhhmmss"
        return formatter.string(from: Date()) + ".mp4"
    }
    
    func presentShareViewForFileAtUrl(url:URL) {
        let controller = UIActivityViewController.init(activityItems: [url],
                                                       applicationActivities: nil)
        self.present(controller, animated: true, completion: nil)
    }
    
    
    func fetchAsset(){
        PhotoManager().fetchAssetsFromLibrary { (success, assets) in
            if success {
                self.assets = assets!
                self.performSegue(withIdentifier: "mediaPicker", sender: nil)
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mediaPicker" {
            let picker = segue.destination as! MediaCollectionViewController
            picker.delegate = self
            picker.assets = self.assets
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
