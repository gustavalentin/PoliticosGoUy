//
//  ViewController.swift
//  PoliticosGoUy
//
//  Created by Gustavo Rodriguez Ramos on 10/11/16.
//  Copyright © 2016 Gustavo Rodriguez Ramos. All rights reserved.
//
//funcion viewdidload -> muestra lo que tiene la vista lo de aca se ejecuta cuando se carga la vista


import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    //variables del view controller
    @IBOutlet weak var mapa: MKMapView! //mapa
    var manager = CLLocationManager() //manager para acceder a la localizacion del mapa
    var regionAver:Int = 250 //para ver la region a ver en metros
    var updateCount = 0
    var tiempo:TimeInterval = 1 //cada que tiempo sale los politicos
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.manager.delegate = self
        var coleccionpoliticos :[Politicos] = []
        coleccionpoliticos = obterTodosPoliticos()
        /*
        //borrar despues de que anden los putos politicos
        //es para ver como carga los malditos politicos
        print ("pokemons creados")
        var nombre:String
        var cantidad:Int16 = 0
        var contador = 0
        for contador in 0...3{
            
            print ("politico: \(contador)")
            nombre = coleccionpoliticos[contador].nombre!
            cantidad = coleccionpoliticos[contador].cantidadcapturado
            
            print ("nombre:  \(nombre)")
            print ("cant capturados: \(cantidad)")
        }*/
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            self.mapa.showsUserLocation = true //muestro la ubucacion
            self.manager.startUpdatingLocation()//actualizo la ubicacion para centrar
            Timer.scheduledTimer(withTimeInterval: tiempo, repeats: true, block: { (timer) in
                //codigo de aprarecer politicos nuevos
                if let coordinates = self.manager.location?.coordinate{
                    let annotacion = MKPointAnnotation()
                    annotacion.coordinate = coordinates
                    annotacion.coordinate.latitude += (Double(arc4random_uniform(1000))-500)/450000
                    annotacion.coordinate.longitude += (Double(arc4random_uniform(1000))-500)/450000
                    self.mapa.addAnnotation(annotacion)
                }
            })
            
            
            
            
        }
        else{
            self.manager.requestWhenInUseAuthorization()
        }
    }
    
    
    
    
    @IBAction func actualizarUbicacion(_ sender: UIButton) {
        if (self.manager.location?.coordinate) != nil{
            let region = MKCoordinateRegionMakeWithDistance(self.manager.location!.coordinate, CLLocationDistance(regionAver), CLLocationDistance(regionAver))
            self.mapa.setRegion(region, animated: true)
        }


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: coreLocationManager
    //visualizacion de la zona del mapa lo usa una unica vez
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if updateCount < 4{
            if (self.manager.location?.coordinate) != nil{
                let region = MKCoordinateRegionMakeWithDistance(self.manager.location!.coordinate, CLLocationDistance(regionAver), CLLocationDistance(regionAver))
                self.mapa.setRegion(region, animated: true)
                updateCount += 1
            }
        }else{
            self.manager.stopUpdatingLocation()
        }
    }
}

