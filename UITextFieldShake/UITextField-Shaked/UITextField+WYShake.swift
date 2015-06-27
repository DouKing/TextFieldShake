//
//  UITextField+WYShake.swift
//  UITextFieldShake
//
//  Created by WuYikai on 15/6/27.
//  Copyright (c) 2015年 secoo. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
  enum WYShakeDirection {
    case Horizontal
    case Vertical
  }

  func wy_shakeWith(var times: Int = 10, delta: CGFloat = 5, speed: NSTimeInterval = 0.03, shakeDirection: WYShakeDirection = .Horizontal, completionHandle: (() -> ())? = nil) {
    let direction: CGFloat = (times % 2 == 0) ? 1 : -1
    UIView.animateWithDuration(speed, animations: { () -> Void in
      self.transform = (shakeDirection == WYShakeDirection.Horizontal) ?
        CGAffineTransformMakeTranslation(delta * direction, 0) :
        CGAffineTransformMakeTranslation(0, delta * direction)
    }) { (finished) -> Void in
      if times <= 0 {
        UIView.animateWithDuration(speed, animations: { () -> Void in
          self.transform = CGAffineTransformIdentity
        }, completion: { (finished) -> Void in
          if let handle = completionHandle {
            handle()
          }
        })
        return
      }
      
      self.wy_shakeWith(times: times - 1, delta: delta, speed: speed, shakeDirection: shakeDirection, completionHandle: completionHandle)
    }
  }
  
}