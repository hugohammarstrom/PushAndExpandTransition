//
//  TargetViewController.swift
//  PushAndExpandTransition
//
//  Created by Hugo Hammarström on 2016-08-28.
//  Copyright © 2016 Hugo Hammarström. All rights reserved.
//

import UIKit

class TargetViewController: UIViewController {
  @IBOutlet weak var backButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
      backButton.layer.cornerRadius = backButton.frame.size.height / 2

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  @IBAction func dismissViewController(sender: AnyObject) {
    self.dismissViewControllerAnimated(true, completion: nil)
  }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
