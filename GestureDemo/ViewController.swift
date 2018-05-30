//
//  ViewController.swift
//  GestureDemo
//
//  Created by Rui Mao on 5/29/18.
//  Copyright © 2018 Rui Mao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var binView: UIImageView!
    @IBOutlet weak var basketballView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan(sender:)))
        basketballView.isUserInteractionEnabled = true
        basketballView.addGestureRecognizer(recognizer)
    }
    
    @objc func handlePan(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        if sender.state == .changed {
            basketballView.center = CGPoint(x: basketballView.center.x + translation.x, y: basketballView.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: view)
        } else if sender.state == .ended { if binView.frame.intersects((sender.view?.frame)!) {
            basketballView.removeFromSuperview()
            }
        }
    }
}

