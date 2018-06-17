//
//  ViewController.swift
//  uilongpressgesture
//
//  Created by Manolescu Mihai Alexandru on 17/06/2018.
//  Copyright © 2018 AVP. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet var viewToPress: UIView!
    @IBOutlet var progressBar: UIProgressView!
    
    var longGesture = UILongPressGestureRecognizer()
    
    var intCounter = Double()
    var timer = Timer()
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
       
        
        longGesture = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.triggeredAction(_:)))
        
        //longGesture.allowableMovement = 99999999
        
        viewToPress.addGestureRecognizer(longGesture)
    
        
    }
    
 
    
    
    @objc func triggeredAction(_ sender: UILongPressGestureRecognizer)
    {
        
        if sender.state == UIGestureRecognizerState.began
        {
            print("start")
            viewToPress.backgroundColor = UIColor.green
            
            runTimer()
        }
        else if sender.state == UIGestureRecognizerState.ended
        {
            print("ended")
            viewToPress.backgroundColor = UIColor.red
            
            timer.invalidate()
            intCounter=0;
            progressBar.progress = 0
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
        
//        UIView.animate(withDuration: 3)
//        {
//            self.progressBar.progress = Float(self.intCounter)
//        }
        
        print(intCounter)
        
        if intCounter <= 0
        {
            timer.invalidate()

        }
    }

    
    
    
    

}

