//
//  PushAndExpandTransition.swift
//  PushAndExpandTransition
//
//  Created by Hugo Hammarström on 2016-08-28.
//  Copyright © 2016 Hugo Hammarström. All rights reserved.
//

import UIKit

class PushAndExpandTransition: NSObject {
  var size: CGSize = CGSizeMake(100, 100)
  var origin: CGPoint = CGPointMake(0, 0)
  var backgroundColor: UIColor = .whiteColor()
  var duration = 0.3
  var finalAnimationDuration = 0.2
  
  enum PushAndExpandTransitionMode: Int{
    case Present, Dismiss
  }
  
  var transitionMode: PushAndExpandTransitionMode = .Present
}

extension PushAndExpandTransition: UIViewControllerAnimatedTransitioning{
  func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
    return duration
  }
  
  func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
    let containerView = transitionContext.containerView()
    if (transitionMode == .Present){
      if let presentedView = transitionContext.viewForKey(UITransitionContextToViewKey), fromView = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey){
        
        let topViewHeight = (origin.y - (size.height/2))
        let bottomViewY = (origin.y + (size.height/2))
        let bottomViewHeight = fromView.view.frame.height - bottomViewY
        let topView = fromView.view.resizableSnapshotViewFromRect(CGRectMake(0, 0, (fromView.view.frame.size.width), topViewHeight), afterScreenUpdates: true, withCapInsets: UIEdgeInsetsMake(0, 0, 0, 0))
        
        let bottomView = fromView.view.resizableSnapshotViewFromRect(CGRectMake(0, bottomViewY, (fromView.view.frame.size.width), bottomViewHeight), afterScreenUpdates: true, withCapInsets: UIEdgeInsetsMake(0, 0, 0, 0))
        bottomView.frame = CGRectMake(0, bottomViewY, bottomView.frame.size.width, bottomView.frame.size.height)
        
        let mainView: UIView = {
          let view: UIView = UIView(frame: fromView.view.frame)
          view.backgroundColor = backgroundColor
          return view
        }()
        
        presentedView.alpha = 0
        
        containerView?.addSubview(mainView)
        containerView?.addSubview(presentedView)
        containerView?.addSubview(topView)
        containerView?.addSubview(bottomView)
        
        
        
        UIView.animateWithDuration(duration - finalAnimationDuration, animations: {
          topView.transform = CGAffineTransformMakeTranslation(0, -topViewHeight)
          bottomView.transform = CGAffineTransformMakeTranslation(0, bottomViewHeight)
          }, completion: { (success: Bool) in
            UIView.animateWithDuration(self.finalAnimationDuration, animations: { 
              presentedView.alpha = 1
              }, completion: { (success: Bool) in
                mainView.removeFromSuperview()
                topView.removeFromSuperview()
                bottomView.removeFromSuperview()
                transitionContext.completeTransition(success)
            })
        })
        
        
      }
    }
  }

}