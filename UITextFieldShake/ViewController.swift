//
//  ViewController.swift
//  UITextFieldShake
//
//  Created by WuYikai on 15/6/27.
//  Copyright (c) 2015年 secoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var textField: UITextField?

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    textField = UITextField(frame: CGRectMake(10, 20, 200, 30))
    textField!.borderStyle = UITextBorderStyle.RoundedRect
    textField!.placeholder = "我是文本框"
    textField!.center = self.view.center
    self.view.addSubview(textField!)
    
    let button: UIButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
    button.frame = CGRectMake(20, 64, 100, 44)
    button.setTitle("Shake", forState: UIControlState.Normal)
    button.addTarget(self, action: "_startShake:", forControlEvents: UIControlEvents.TouchUpInside)
    self.view.addSubview(button)
    
  }
  
  // MARK: - 执行振动
  func _startShake(sender: UIButton) {
    self.textField?.wy_shakeWith(completionHandle: {() -> () in
      println("我是回调啊")
    })
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}

