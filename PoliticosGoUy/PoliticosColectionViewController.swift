//
//  PoliticosColectionViewController.swift
//  PoliticosGoUy
//
//  Created by Gustavo Rodriguez Ramos on 10/12/16.
//  Copyright © 2016 Gustavo Rodriguez Ramos. All rights reserved.
//

import UIKit

class PoliticosColectionViewController: UIViewController {
    @IBOutlet weak var tablaPoliticosdex: UITableView!
    var politicosCapturados : [Politicos] = []
    var politicosLibres : [Politicos] = []
    


    override func viewDidLoad() {
        super.viewDidLoad()
        self.politicosCapturados = obtenerPoliticosCapturados()
        self.politicosLibres = obtenerPoliticosNoCapturados()
        print ("capturados:  \(self.politicosCapturados.count)")
        print ("libres: \(self.politicosLibres.count)")
        // Do any additional setup after loading the view.
        //selecciona bien la putas variables PAJERO!!!!!!!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func volver(_ sender: UIButton) {
        self.dismiss(animated: true) {
        }
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
