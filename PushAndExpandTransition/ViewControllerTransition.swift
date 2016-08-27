//
//  ViewControllerTransition.swift
//  PushAndExpandTransition
//
//  Created by Hugo Hammarström on 2016-08-28.
//  Copyright © 2016 Hugo Hammarström. All rights reserved.
//

import UIKit

extension ViewController: UIViewControllerTransitioningDelegate{
  func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    transition.duration = 0.5
    transition.size = (selectedButton?.frame.size)!
    transition.origin = (selectedButton?.superview?.convertPoint(selectedButton!.center, toView: self.view))!
    transition.backgroundColor = (selectedButton?.backgroundColor)!
    return transition
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    let target = segue.destinationViewController as! TargetViewController
    target.transitioningDelegate = self
    target.view.backgroundColor = selectedButton?.backgroundColor
    target.modalPresentationStyle = .Custom
  }
}
