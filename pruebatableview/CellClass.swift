//
//  CellClass.swift
//  pruebatableview
//
//  Created by mulder on 07/02/2020.
//  Copyright © 2020 mulder. All rights reserved.
//

import Foundation

import UIKit



class CellClass: UITableViewCell{
    
    
    
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelNota: UILabel!
    @IBOutlet weak var labelHora: UILabel!
    @IBOutlet weak var btCompra: UIButton!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var notaImg: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
        print(ViewController.lista.ind)
    
        labelTitulo.text = ViewController.lista.listaPeliculas[ViewController.lista.ind].titulo
        //con un switch segun sea la nota poner una imagen u otra
        
        labelNota.text = ViewController.lista.listaPeliculas[ViewController.lista.ind].nota
        
        var notaAux = Int(ViewController.lista.listaPeliculas[ViewController.lista.ind].nota)
        
        
        switch(notaAux){
        case 1:
            let img = UIImage(named:"una")
            self.notaImg.image = img
            
        case 2:
            let img = UIImage(named:"dos")
            self.notaImg.image = img
        case 3:
            let img = UIImage(named:"tres")
            self.notaImg.image = img
        case 4:
            let img = UIImage(named:"cuatro")
            self.notaImg.image = img
        case 5:
            let img = UIImage(named:"cinco")
            self.notaImg.image = img

        default:
            let img = UIImage(named:"una")
            self.notaImg.image = img
        }
        
        
        labelHora.text = ViewController.lista.listaPeliculas[ViewController.lista.ind].hora

 
        guard let imageURL = URL(string: ViewController.lista.listaPeliculas[ViewController.lista.ind].url) else { return }

            // just not to cause a deadlock in UI!
            DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.img.image = image
            }
        }

    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        //print(ViewController.lista.listaPeliculas.count)
    }
    
    
}
