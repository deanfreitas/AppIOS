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

    private let valid = Valid()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculate(sender: UIButton) {
        let user: String! = fieldNum1.text
        let password: String! = fieldNum2.text
        let login = Login(user: user, password: password)
        let message = valid.checkIsLogin(login: login)

        if !message.isEmpty {
            showAlertClick(message: message)
        }
    }

    func showAlertClick(message: String) {
        let alert = UIAlertController(title: "Title", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
