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
    
    let myDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let myButton = UIButton(frame: CGRect(x: self.view.bounds.width / 2 - 125, y: self.view.bounds.height / 2 - 62.5, width: 250, height: 125))
        myButton.backgroundColor = UIColor.blueColor()
        myButton.setTitle("ON", forState: UIControlState.Normal)
        myButton.addTarget(self, action: #selector(buttonAction), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(myButton)
    }
    
    func buttonAction(sender: UIButton!) {
        
        //        let avDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        // check if the device has torch
        if  myDevice.hasTorch {
            // lock your device for configuration
            do {
                try myDevice.lockForConfiguration()
            }
            catch {
                return
            }
            
            // check if your torchMode is on or off. If on turns it off otherwise turns it on
            //            myDevice.torchMode = myDevice.torchActive ? AVCaptureTorchMode.Off : AVCaptureTorchMode.On
            
            //            if (sender.currentTitle == "ON") {
            //                myDevice.torchMode = AVCaptureTorchMode.Off
            //                sender.setTitle("ON", forState: UIControlState.Normal);
            //            }
            //            else {
            //                myDevice.torchMode = AVCaptureTorchMode.On
            //                sender.setTitle("OFF", forState: UIControlState.Normal);
            //            }
            
            // sets the torch intensity to 100%
            //            if (!self.myDevice.torchActive) {
            
            if (sender.currentTitle == "ON") {
                do {
                    try self.myDevice.setTorchModeOnWithLevel(1.0)
                }
                catch {
                    return
                }
                sender.setTitle("OFF", forState: UIControlState.Normal);
            }
            else {
                self.myDevice.torchMode = AVCaptureTorchMode.Off
                sender.setTitle("ON", forState: UIControlState.Normal);
            }
            
            // unlock your device
            myDevice.unlockForConfiguration()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

