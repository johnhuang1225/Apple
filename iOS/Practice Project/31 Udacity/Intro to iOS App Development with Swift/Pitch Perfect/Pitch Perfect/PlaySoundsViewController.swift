//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by John Huang on 2015/11/7.
//  Copyright © 2015年 JohnHuang. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    var audioPlayer: AVAudioPlayer!
    var receiveAudio: RecordedAudio!
    
    var audioEngine: AVAudioEngine!
    var audioFile: AVAudioFile!
    
    // MARK: - my func
    
    @IBAction func slowSound(sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.rate = 0.5
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }
    
    @IBAction func playFastSound(sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.rate = 2.0
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
        
    }
    
    @IBAction func stopSound(sender: UIButton) {
        audioPlayer.stop()
    }
    
    @IBAction func playChipmunkAudio(sender: UIButton) {
        playAudioWithVariablePitch(1000)
    }
    
    @IBAction func playDarthvaderAudio(sender: UIButton) {
        playAudioWithVariablePitch(-1000)
    }
    
    
    
    func playAudioWithVariablePitch(pitch: Float) {
        
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        let audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        let changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        try! audioEngine.start()
        audioPlayerNode.play()
    }
    
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        if let filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3") {
//            let filePathURL = NSURL(fileURLWithPath: filePath)
//            audioPlayer = try! AVAudioPlayer(contentsOfURL: filePathURL)
//            audioPlayer.enableRate = true
//            
//        } else {
//            print("the filePath is empty")
//        }
        
        
        audioPlayer = try! AVAudioPlayer(contentsOfURL: receiveAudio.filePathURL)
        audioPlayer.enableRate = true
        
        audioEngine = AVAudioEngine()
        audioFile = try! AVAudioFile(forReading: receiveAudio.filePathURL)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
