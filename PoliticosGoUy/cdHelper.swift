//
//  cdHelper.swift
//  PoliticosGoUy
//
//  Created by Gustavo Rodriguez Ramos on 10/13/16.
//  Copyright © 2016 Gustavo Rodriguez Ramos. All rights reserved.
//

import Foundation
import UIKit
import CoreData


func crearPoliticos(){
    //obtengo la instancia de politicos
    
    
//=======================================================
//===============aca creo a los politicos================
//=======================================================
    crearPolitico(nombre: "tabare", imagen: "zubat", numero: 1, partido: "frente amplio")
    crearPolitico(nombre: "luis", imagen:  "squirtle", numero: 2, partido: "partido nacional")
    crearPolitico(nombre: "pedro", imagen: "charmander", numero: 3, partido: "partido colorado")
    crearPolitico(nombre: "pablo", imagen:  "jigglypuff", numero: 3, partido: "partido independiente")
    
//=================================================================
    (UIApplication.shared.delegate as! AppDelegate).saveContext()
}

func crearPolitico (nombre:String, imagen:String, numero:Int16, partido:String){
    let contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let politico = Politicos(context:contexto) 
    politico.nombre = nombre
    politico.imagen = imagen
    politico.numero = numero
    politico.partido = partido
}
func obterTodosPoliticos() -> [Politicos]{
    let contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    do{
    let politicos = try contexto.fetch(Politicos.fetchRequest()) as! [Politicos]
        if politicos.count == 0 {
            crearPoliticos()
            return obterTodosPoliticos()
        }
    return politicos
    }
    catch{
        print ("problema al obtener ")
        return []
    }
}



func obtenerPoliticosCapturados() -> [Politicos]{
    let contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let fechtRecuest = Politicos.fetchRequest() as NSFetchRequest<Politicos>
    fechtRecuest.predicate = NSPredicate(format: "cantidadcapturado < %d", 0)
    do{
        let politicos = try contexto.fetch(fechtRecuest) as [Politicos]
        print("aca debe de ser 0")
        print("dentro cpHelper \(politicos.count)")
        return politicos
    }
    catch{
        print ("problema al obtener politicos")
        return []
    }
}



func obtenerPoliticosNoCapturados() -> [Politicos]{
    let contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let fechtRecuest = Politicos.fetchRequest() as NSFetchRequest<Politicos>
    fechtRecuest.predicate = NSPredicate(format: "cantidadcapturado == %d", 0)
    do{
        let politicos = try contexto.fetch(fechtRecuest) as [Politicos]
        print("aca debe de ser 4")
        print("dentro cpHelper \(politicos.count)")
        return politicos
    }
    catch{
        print ("problema al obtener politicos")
        return []
    }
}
