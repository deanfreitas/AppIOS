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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func login(sender: UIButton) {
        let user: String! = self.fieldNum1.text
        let password: String! = self.fieldNum2.text
        let login: Login = Login(user: user, password: password)
        let message: String = self.loginUtils.checkLoginIsEmpty(login: login)

        if !message.isEmpty {
            return showAlertClick(message: message)
        }

        do {
            let attributes: SqliteAttributes = SqliteAttributes(table: "login", conditionField: "log_user", listGetField: ["log_user"], condition: login.user)
            let result: Any = try self.sqliteTable.selectTable(attributes: attributes)

            if !Utils.checkTypeObject(object: result, typeObject: Login.self) {
                print(GenericError.system.rawValue)
                showAlertClick(message: GenericError.system.rawValue)
            }

            let registeredLogin: Login = result as! Login

            if registeredLogin.password != login.password {
                showAlertClick(message: "Your user or password is wrong")
            }

        } catch let error as SqliteError {
            print(error.getError)
            showAlertClick(message: error.getError)
        } catch let error as GenericError {
            print(error.getError)
            showAlertClick(message: error.getError)
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
