//
//  ViewController.swift
//  MaxBernstein-Studio1
//
//  Created by Max Bernstein on 9/5/18.
//  Copyright © 2018 Max Bernstein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var theSlider: UISlider!
    @IBOutlet weak var theImage: UIImageView!
    
    @IBAction func sliderMove(_ sender: Any) {
        theImage.alpha = CGFloat(theSlider.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

