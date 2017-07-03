//
//  ViewController.swift
//  cardRotation
//
//  Created by April on 2017/7/3.
//  Copyright © 2017年 April. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    
    var backView: UIImageView!
    var frontView: UIImageView!
    
    var isFront: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createBackAndFrontView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func createBackAndFrontView () {
        
        let viewSize = contentView.frame.size
        
        frontView  = UIImageView (frame: CGRect(x: 0, y: 0, width: viewSize.width, height: viewSize.height))
        frontView.image = UIImage(named: "PlayingCardHeartA")
        contentView.addSubview(frontView)
        
        backView = UIImageView(frame: CGRect(x: 0, y: 0, width: viewSize.width, height: viewSize.height))
        backView.image = UIImage(named: "PlayingCardBack")
        contentView.addSubview(backView)
    }
    
    func cardAnimation() {
        
        if isFront {
            UIView.transition(from: frontView, to: backView , duration: 0.5, options: .transitionFlipFromLeft, completion: nil)
        } else {
            UIView.transition(from: backView, to: frontView, duration: 0.5, options: .transitionFlipFromLeft, completion: nil)
        }
        
        isFront = !isFront
    }
    
    @IBAction func handleTapGesture(_ sender: UITapGestureRecognizer) {
        cardAnimation()
    }
    

}

