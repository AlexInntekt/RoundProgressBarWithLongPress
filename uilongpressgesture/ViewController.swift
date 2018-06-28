//
//  ViewController.swift
//  uilongpressgesture
//
//  Created by Manolescu Mihai Alexandru on 17/06/2018.
//  Copyright © 2018 AVP. All rights reserved.
//


import UIKit
import AVFoundation
import Foundation
import AudioToolbox

var feedbackPlayer: AVAudioPlayer?

class ViewController: UIViewController
{
 
    @IBOutlet var viewToPress: KDCircularProgress!
    
    
    @IBOutlet var progressBar: UIProgressView!
    
    var longGesture = UILongPressGestureRecognizer()
    
    var intCounter = Double()
    var timer = Timer()
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        
        longGesture = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.triggeredAction(_:)))

        viewToPress.addGestureRecognizer(longGesture)
        
        
        
    }
    
 
    
    func playFeedbackSound()
    {
        guard let url = Bundle.main.url(forResource: "space", withExtension: "mp3")
            else {return}
          do
            {
              try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
              try AVAudioSession.sharedInstance().setActive(true)
                
              feedbackPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
              
                guard let player = feedbackPlayer else {return}
                
              feedbackPlayer?.play()
            }
          catch let error
           {
             print(error.localizedDescription)
           }
        
        //vibrate:
        AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
    }
    
    @objc func triggeredAction(_ sender: UILongPressGestureRecognizer)
    {
        
        if sender.state == UIGestureRecognizerState.began
        {
            print("start")
            viewToPress.backgroundColor = UIColor.green
            
            runTimer()
            
            playFeedbackSound()
        }
        else if sender.state == UIGestureRecognizerState.ended
        {
            print("ended")
            viewToPress.backgroundColor = UIColor.red
            
            timer.invalidate()
            intCounter=0;
            progressBar.progress = 0
            viewToPress.angle = 0
            
            feedbackPlayer?.stop()
        }
        
        
    }
    
    
    
    
    
    
    func initializeTimer()
    {
      runTimer()
        
    }
    
    func runTimer()
    {
        timer.invalidate()
       
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateCountup), userInfo: nil, repeats: true)
    }
    
    
    func reset()
    {
       runTimer()
    }
    
    @objc func updateCountup()
    {
        intCounter += 0.005
        self.progressBar.progress = Float(self.intCounter)
        
        self.viewToPress.angle += 1.8
       
        
        print(intCounter)
        
        if intCounter >= 1
        {
            timer.invalidate()
            self.progressBar.progress = 0
            intCounter = 0

        }
    }

    
    
    
    

}

