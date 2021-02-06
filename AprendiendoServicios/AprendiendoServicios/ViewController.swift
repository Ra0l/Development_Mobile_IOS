//
//  ViewController.swift
//  AprendiendoServicios
//
//  Created by Raul Kevin Aliaga Shapiama on 2/5/21.
//  Copyright © 2021 Raul Kevin Aliaga Shapiama. All rights reserved.
//

import UIKit
import Alamofire

//1. Crear modelo Codable -OK
//2. Utilizar JSONDecoder para serializar Data a modelo
struct Human: Codable {
    let user: String
    let age: Int
    let isHappy: Bool
}


class ViewController: UIViewController {
    //MARK: -- Referencias UI
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchService()
    }
    //Endpoint: https://www.mocky.io/v2/5e2674472f00002800a4f417
    //1. Crear excepcion de seguridad -- Ok
    //2. Crear URL con e endpint - OK
    //3. Hacer request con la ayuda de URLSesion -ok
    //4. Transformar respuesta a diccionario - ok
    //5. Ejecutar Request - ok
    private func fetchService(){
        let endpointString = "https://www.mocky.io/v2/5e2674472f00002800a4f417"
        guard let endpoint = URL(string: endpointString) else{
            return
        }
        
        //Iniciamos el loader
        activityIndicator.startAnimating()
        
        AF.request(endpoint, method: .get, parameters: nil).responseData { (response: AFDataResponse<Data>) in
            
            //Detener el loader
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
            }
            
            if response.error != nil{
                print("Have error!")
                return
            }
            
            guard let dataFromService = response.data,
                let model: Human = try? JSONDecoder().decode(Human.self, from: dataFromService) else{
                
                return
            }
            
            //Importante todos los llamados a la UI, se hace en el main thead(pregunta de entrevista)
            DispatchQueue.main.async {
                self.nameLabel.text = model.user
                self.statusLabel.text = model.isHappy ? "Is Happy 😄 !" : "Is Sad 🥺!"
                self.ageLabel.text = String(model.age)
             }
        }
    }

}

