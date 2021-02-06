//
//  TweetTableViewCell.swift
//  AprendiendoTablas
//
//  Created by Raul Kevin Aliaga Shapiama on 2/5/21.
//  Copyright © 2021 Raul Kevin Aliaga Shapiama. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    //MARK: -- Referencia a la UI
    @IBOutlet weak var userImageView: UIView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userImageView.clipsToBounds = true
        
        //frame.width = ancho
        userImageView.layer.cornerRadius = userImageView.frame.width / 2
    }
    
    func setupCell(username: String, message: String){
        usernameLabel.text = username
        messageLabel.text = message
    }
}
