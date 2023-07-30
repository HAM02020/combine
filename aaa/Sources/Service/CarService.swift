//
//  CarService.swift
//  RealmDemo
//
//  Created by my on 2023/7/30.
//

import Foundation

class CarService {
    private var carDAO: CarDAO
    
    init() {
        carDAO = CarDAOImpl()
    }
    
    func addCar(_ car: Car){
        carDAO.addCar(car)
    }
    
    func getAllCars()->[Car]{
        let results = carDAO.getAllCars()
        return Array(results)
    }
    func deleteAll(){
        carDAO.deleteAll()
    }
}
