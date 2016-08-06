//
//  ViewController.swift
//  Flashlight
//
//  Created by Scotty Shaw on 8/6/16.
//  Copyright © 2016 ___sks6___. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //    var myButtom: UIButton!
    let myDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let myButton = UIButton(frame: CGRect(x: self.view.bounds.width / 2, y: self.view.bounds.height / 2, width: 250, height: 125))
        myButton.backgroundColor = UIColor.blueColor()
        myButton.setTitle("ON", forState: UIControlState.Normal)
        myButton.addTarget(self, action: #selector(buttonAction), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(myButton)
    }
    
    func buttonAction(sender: UIButton!) {
        if (myDevice.hasTorch) {
            do {
                try myDevice.lockForConfiguration()
            } catch {
                return
            }
            if (sender.currentTitle == "ON") {
                myDevice.torchMode = AVCaptureTorchMode.Off
                sender.setTitle("ON", forState: UIControlState.Normal);
            }
            else {
                myDevice.torchMode = AVCaptureTorchMode.On
                sender.setTitle("OFF", forState: UIControlState.Normal);
            }
            myDevice.unlockForConfiguration()
        }
        else {
            //            let alertView = UIAlertControllerStyleAlert()
            //            alertView.message = "No Flash Detected!"
            //            alertView.addButtonWithTitle("OK")
            //            alertView.show()
            print("no flash")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

