//
//  ViewController.swift
//  pruebatableview
//
//  Created by mulder on 22/01/2020.
//  Copyright © 2020 mulder. All rights reserved.
//

import UIKit
import FirebaseDatabase


//añadimos tableviewdatasource
class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{
   
    @IBOutlet weak var tableView: UITableView!
    
    struct lista {
        static var listaPeliculas = [Pelicula]()
        static var ind = 0
    }
    
    let ref = Database.database().reference()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewController.lista.listaPeliculas.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! CellClass
        
        lista.ind += 1
        
        cell.contentView.backgroundColor = UIColor(white: 0.95, alpha: 1)

        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    

    func cargaDatos(){
        //obtenemos datos en tiempo real
              
              ref.child("Cartelera").observe( .value) { (snapshot) in
                ViewController.lista.listaPeliculas.removeAll()
                  for i in snapshot.children.allObjects as! [DataSnapshot]{
                      

                      let dict = i.value as! [String: Any]
                      let tit = dict["titulo"] as! String
                      let nota = dict["nota"] as! String
                      let hora = dict["hora"] as! String
                      let url = dict["cover"] as! String
        
                      var p = Pelicula()
                    
                      
                      p.titulo = tit
                      p.hora = hora
                      p.nota = nota
                      p.url = url
                          
                      ViewController.lista.listaPeliculas.append(p)
                      
                      print(p.titulo)
                  
                  }
                
                self.tableView.reloadData()
                
                
                  
              }
    }
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.rowHeight = 200
        
        
        tableView.separatorColor = UIColor(white: 0.95, alpha: 1)
        tableView.dataSource = self
        tableView.delegate = self
        
        cargaDatos()
    }
    
    
   
}

