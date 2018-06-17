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
    
    var longGesture = UILongPressGestureRecognizer()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        longGesture = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.triggeredAction(_:)))
        longGesture.minimumPressDuration = 6
        longGesture.allowableMovement = 99999999
        
        viewToPress.addGestureRecognizer(longGesture)
        
        
        
    }
    
    @objc func triggeredAction(_ sender: UILongPressGestureRecognizer)
    {
        let alertC = UIAlertController(title: "LongPressGestureRecognizer", message: "LongPressGesture was triggered", preferredStyle: UIAlertControllerStyle.alert)
        let ok = UIAlertAction(title: "okay", style: UIAlertActionStyle.default) { (alert) in
        }
        alertC.addAction(ok)
        self.present(alertC, animated: true, completion: nil)
    }
    
    

}

