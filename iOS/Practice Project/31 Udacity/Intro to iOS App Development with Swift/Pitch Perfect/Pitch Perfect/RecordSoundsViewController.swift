//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by John Huang on 2015/11/5.
//  Copyright © 2015年 JohnHuang. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var recordingInProgress: UILabel!
    
    @IBOutlet weak var recordButton: UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    
    var audioRecord: AVAudioRecorder!
    
    var recordedAudio: RecordedAudio!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        recordButton.enabled = true
        stopButton.hidden = true
        recordingInProgress.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "stopRecording") {
            let playSoundVC: PlaySoundsViewController = segue.destinationViewController as! PlaySoundsViewController
            let data = sender as! RecordedAudio
            playSoundVC.receiveAudio = data
        }
    }

    // MARK: - my func
    @IBAction func recordAudio(sender: UIButton) {
        stopButton.hidden = false
        recordingInProgress.hidden = false
        recordButton.enabled = false
        
        // Record the user`s voice
        // 取得路徑
        let dirPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0]
        
        // 設定檔案名稱
//        let currentDateTime = NSDate()
//        let formatter = NSDateFormatter()
//        formatter.dateFormat = "ddMMyyyy-HHmmss"
//        let recordName = formatter.stringFromDate(currentDateTime) + ".wav"
        
        let recordName = "my_audio.wav"
        let pathArray = [dirPath, recordName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        try! audioRecord = AVAudioRecorder(URL: filePath!, settings: [:])
        audioRecord.delegate = self
        audioRecord.meteringEnabled = true
        audioRecord.prepareToRecord()
        audioRecord.record()
        
    }
    
    
    @IBAction func stopRecord(sender: UIButton) {
        recordingInProgress.hidden = true
        stopButton.hidden = true
        recordButton.hidden = false
        
        audioRecord.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        
    }

    // MARK: - AVAudioRecorderDelegate
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        if(flag) {
            
            // step1 - save the record aduio
            recordedAudio = RecordedAudio()
            recordedAudio.filePathURL = recorder.url
            recordedAudio.title = recorder.url.lastPathComponent
            print("audioRecorderDidFinishRecording")
            // step2 - move to the next scene aka perform segue
            self.performSegueWithIdentifier("stopRecording", sender: recordedAudio)
            
        } else {
            
            print("錄音失敗！")
            recordButton.enabled = true
            stopButton.hidden = true
            
        }
    
    }
    
}

