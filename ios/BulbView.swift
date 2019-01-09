//
//  BulbView.swift
//  LightViewApp
//
//  Created by Abhishek Nalwaya on 09/01/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

import UIKit

class BulbView: UIView {
  @objc var onStatusChange: RCTDirectEventBlock?
  
  @objc var isOn: Bool = false  {
    didSet {
      button.setTitle(String(describing: isOn ? "Switch Off" : "Switch On"), for: .normal)
      button.backgroundColor = isOn ? .yellow : .black
    }
  }
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.addSubview(button)
  }
  required init?(coder aDecoder: NSCoder) {
    fatalError("init has not been implemented")
  }
  lazy var button: UIButton = {
    let button = UIButton.init(type: UIButton.ButtonType.system)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    button.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    button.addTarget(
      self,
      action: #selector(changeBulbStatus),
      for: .touchUpInside
    )
    return button
  }()
  
  @objc func changeBulbStatus() {
    isOn = !isOn as Bool
    onStatusChange!(["isOn": isOn])
  }
}
