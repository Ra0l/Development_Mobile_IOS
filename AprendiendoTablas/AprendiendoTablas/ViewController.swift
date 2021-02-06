//
//  ViewController.swift
//  AprendiendoTablas
//
//  Created by Raul Kevin Aliaga Shapiama on 2/5/21.
//  Copyright © 2021 Raul Kevin Aliaga Shapiama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: -- Referencia de la tabla
    @IBOutlet weak var tableView: UITableView!
    
    private var dataSource = [
        "@carlosmejia083",
        "@raulaliaga966",
        "@allyf768",
        "@kevn123"
    ]
    
    /*
     1.-Impelmentar nuestro DataSource <- interfaz
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //No olvidar :-)
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TweetTableViewCell", bundle: nil), forCellReuseIdentifier: "TweetTableViewCell")
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "mi-celda")
        
        //Para interactuar, implementar el delegate
        tableView.delegate = self
    }
}

//MARK: -- UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(dataSource[indexPath.row]) fue seleccionada!")
    }
}

//MARK: -- UITableViewDataSource
extension ViewController:  UITableViewDataSource{
    //1.- Numero de filas que tendra nuestra tabla
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    //2. Método para saber que celdas deben mostrarse
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetTableViewCell", for: indexPath)
        
        //Configuracion de la celda
        if let newCell = cell  as? TweetTableViewCell{
            newCell.setupCell(username: dataSource[indexPath.row], message: "Soy un tweet!")
        }
        
        return cell
    }
}
