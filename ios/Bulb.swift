//
//  Bulb.swift
//  LightViewApp
//
//  Created by Abhishek Nalwaya on 09/01/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

import Foundation


@objc(Bulb)
class Bulb: RCTViewManager {
  
  override func view() -> UIView! {
    return BulbView()
  }
  
  override static func requiresMainQueueSetup() -> Bool {
    return true
  }
}
