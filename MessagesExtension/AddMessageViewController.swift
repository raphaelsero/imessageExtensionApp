//
//  AddMessageViewController.swift
//  u gud bro?
//
//  Created by Raphael Cabral on 8/8/17.
//  Copyright © 2017 Raphael Cabral. All rights reserved.
//

import UIKit

protocol AddMessageViewControllerDelegate : class {
    func addMessageViewControllerDidSubmit(image: UIImage, caption: String)
}

class AddMessageViewController: UIViewController {
    weak var delegate : AddMessageViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func AddMessage(){
        let img = UIImage(named: "ugudbro.png")
        let caption = ""
        self.delegate.addMessageViewControllerDidSubmit(image: img!, caption: caption)
    }
}
