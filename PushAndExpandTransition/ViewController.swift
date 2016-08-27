//
//  ViewController.swift
//  PushAndExpandTransition
//
//  Created by Hugo Hammarström on 2016-08-27.
//  Copyright © 2016 Hugo Hammarström. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet var buttons: [UIButton]!
  var selectedButton: UIButton?
  var transition = PushAndExpandTransition()
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func transitonButtonClicked(sender: AnyObject) {
    if let index = buttons.indexOf(sender as! UIButton){
      selectedButton = buttons[index]
      self.performSegueWithIdentifier("transitionSegue", sender: self)
    }
  }

}

