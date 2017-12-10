//
//  ViewController.swift
//  AppIOS
//
//  Created by Gilberto Freitas on 10/12/17.
//  Copyright © 2017 Gilberto Freitas. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var fieldNum1: UITextField!
    @IBOutlet weak var fieldNum2: UITextField!
    @IBOutlet weak var labelResult: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculate(sender: UIButton) {
        let num1: Int! = Int(fieldNum1.text!)
        let num2: Int! = Int(fieldNum2.text!)
        let result = num1 + num2

        labelResult.text = "The Result is \(result)"
    }
}
