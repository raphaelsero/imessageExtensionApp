//
//  MessageDetailsViewController.swift
//  u gud bro?
//
//  Created by Raphael Cabral on 8/8/17.
//  Copyright © 2017 Raphael Cabral. All rights reserved.
//

import UIKit

protocol MessageDetailsViewControllerDelegate : class {
    func messageDetailsViewControllerDidSubmit(image: UIImage, caption: String)
}

class MessageDetailsViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    var delegate : MessageDetailsViewControllerDelegate!
    
    @IBOutlet var image: UIImageView!

    var lastPoint = CGPoint.zero
    var swiped = false
    
    @IBAction func Reply(){
        let caption = ""
        let img = image.image
        self.delegate.messageDetailsViewControllerDidSubmit(image: img!, caption: caption)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
        lastPoint = touch.location(in: self.view)
        }
    }
    
    func drawLines(fromPoint:CGPoint, toPoint:CGPoint) {
        UIGraphicsBeginImageContext(self.view.frame.size)
        image.image?.draw(in: CGRect(x: 0, y:0, width: self.view.frame.width, height: self.view.frame.height))
    
        let context = UIGraphicsGetCurrentContext()
    
        context?.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
        context?.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y))
        context?.setBlendMode(CGBlendMode.normal)
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(5)
        context?.setStrokeColor(UIColor(red:0, green: 0, blue:0, alpha: 1.0 ).cgColor)
        context?.strokePath()
    
        image.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = true
        if let touch = touches.first{
            let currentPoint = touch.location(in: self.view)
            drawLines(fromPoint: lastPoint, toPoint: currentPoint)
            lastPoint = currentPoint
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
            drawLines(fromPoint: lastPoint, toPoint: lastPoint)
        }
    }
}
