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
    var regionAver:double_t = 250 //para ver la region a ver en metros
    var updateCount = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.manager.delegate = self
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            self.mapa.showsUserLocation = true //muestro la ubucacion
            self.manager.startUpdatingLocation()//actualizo la ubicacion para centrar
        }
        else{
            self.manager.requestWhenInUseAuthorization()
        }

    }
    @IBAction func actualizarUbicacion(_ sender: UIButton) {
        if (self.manager.location?.coordinate) != nil{
            let region = MKCoordinateRegionMakeWithDistance(self.manager.location!.coordinate, regionAver, regionAver)
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
                let region = MKCoordinateRegionMakeWithDistance(self.manager.location!.coordinate, regionAver, regionAver)
                self.mapa.setRegion(region, animated: true)
                updateCount += 1
            }
        }else{
            self.manager.stopUpdatingLocation()
        }
    }
}

