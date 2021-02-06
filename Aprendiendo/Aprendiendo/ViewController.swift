//
//  ViewController.swift
//  Aprendiendo
//
//  Created by Raul Kevin Aliaga Shapiama on 2/4/21.
//  Copyright © 2021 Raul Kevin Aliaga Shapiama. All rights reserved.
//

import UIKit
import PopupDialog

class ViewController: UIViewController {
    //MARK: -- References UI
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailSwitch: UISwitch!
    
    
    
    //MARK: -- Actions
    @IBAction func loginButtonAction(_ sender: Any) {
        //1.-Obtener los valores de los textFields
        
        let email = emailTextField.text
        let password = passwordTextField.text
        
        if email == "raul@gmail.com", password == "123"{
            if emailSwitch.isOn{
                //De est amanera guardamos calores con llave y valor en los UserDefaults
                storage.set(email, forKey: emailkey)
            }else{
                storage.removeObject(forKey: emailkey)
            }
            performSegue(withIdentifier: "Home_segue", sender: nil)
            print("Bienvenido \(email)")
        } else{
            //print("Credenciales invalidos")
            showErrorDialog()
        }
    }
    
    private let emailkey = "email-key"
    private let storage = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //De esta manera buscamos un string en los UserDefaults y lo asignamos
        if let storageEmail = storage.string(forKey: emailkey){
            emailTextField.text = storageEmail
            emailSwitch.isOn = true
        } else{
            emailSwitch.isOn = false
        }
    }
    
    private func showErrorDialog(){
        // Prepare the popup assets
        let title = "Error"
        let message = "Credeenciales invalidas"
        let image = UIImage(named: "pexels-photo-103290")

        // Create the dialog
        let popup = PopupDialog(title: title, message: message, image: image)

        // Create buttons
        let buttonOne = CancelButton(title: "CANCEL") {
            print("You canceled the car dialog.")
        }

        // Add buttons to dialog
        // Alternatively, you can use popup.addButton(buttonOne)
        // to add a single button
        popup.addButtons([buttonOne])

        // Present dialog
        self.present(popup, animated: true, completion: nil)
    }
}

