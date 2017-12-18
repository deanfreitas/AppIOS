//
//  ViewController.swift
//  AppIOS
//
//  Created by Gilberto Freitas on 10/12/17.
//  Copyright © 2017 Gilberto Freitas. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var fieldNum1: UITextField!
    @IBOutlet weak var fieldNum2: UITextField!

    private let loginUtils: LoginUtils = LoginUtils()
    private let sqliteTable: SqliteTable = SqliteTable()

    private var login: Login!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculate(sender: UIButton) {
        let user: String! = self.fieldNum1.text
        let password: String! = self.fieldNum2.text
        let login: Login = Login(user: user, password: password)
        let message: String = self.loginUtils.checkLoginIsEmpty(login: login)

        if !message.isEmpty {
            return showAlertClick(message: message)
        }

        do {
            self.login = try self.sqliteTable.selectTable(object: login, field: "user", condition: login.user) as! Login
            if self.login.password != login.password {
                showAlertClick(message: "Your user or password is wrong")
            }
        } catch SqliteError.database(let error) {
            print(error)
            showAlertClick(message: error)
        } catch SqliteError.select(let error) {
            print(error)
            showAlertClick(message: error)
        } catch SqliteError.selectNotFound(let error) {
            print(error)
            showAlertClick(message: "Your user or password is wrong")
        } catch {
            print(error)
            showAlertClick(message: error.localizedDescription)
        }
    }

    func showAlertClick(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
