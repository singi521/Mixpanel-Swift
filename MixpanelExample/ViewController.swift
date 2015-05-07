//
//  ViewController.swift
//  MixpanelExample
//
//  Created by vincentyen on 5/7/15.
//  Copyright (c) 2015 Fun Anima Co., Ltd. All rights reserved.
//

//please go to:https://mixpanel.com/help/reference/ios


import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func sendEvent(){
        
        Mixpanel.sharedInstance().track("Plan Selected", properties: ["Gender":"Female"])
    }
    
    //Timing events
    func timingEvent(){
        /*Mixpanel *mixpanel = [Mixpanel sharedInstance];
        
        [mixpanel timeEvent:@"Image Upload"];
        
        [self uploadImageWithSuccessHandler:^{
        [mixpanel track:@"Image Upload"];
        }];*/
        
        Mixpanel.sharedInstance().timeEvent("Image Upload")
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            Mixpanel.sharedInstance().track("Image Upload")
        })
        
    }

    //Super properties
    func superProperties(){
        var dict = [""]
        Mixpanel.sharedInstance().registerSuperProperties(["info":["User Type":"Paid"]])
        
        Mixpanel.sharedInstance().track("Signup", properties: ["info":["signup_button":"test12"]])
    }
    
    
    @IBAction func onTappedSendEvent(sender: AnyObject) {
        self.sendEvent()
    }
    @IBAction func onTappedTimingEvent(sender: AnyObject) {
        self.timingEvent()
    }
    @IBAction func onTappedProperties(sender: AnyObject) {
        self.superProperties()
    }
}

