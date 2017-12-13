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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculate(sender: UIButton) {
        let login: String? = fieldNum1.text
        let password: String? = fieldNum2.text

        var message: String = "You need send your"
        var isValidLogin: Bool = true

        if login == "" {
            message += "\n login"
            isValidLogin = false
        }

        if password == "" {
            message += "\n password"
            isValidLogin = false
        }

        if !isValidLogin {
            let alert = UIAlertController(title: "Title", message: message, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
