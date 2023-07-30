//
//  CarDao.swift
//  RealmDemo
//
//  Created by my on 2023/7/30.
//

import Foundation
import RealmSwift

protocol CarDAO{
    func changePrice(_ objcet: Car)
    func getAllCars()->Results<Car>
    func addCar(_ car: Car)
    func deleteAll()
}

class CarDAOImpl: RealmDAO<Car>, CarDAO{
    
    func addCar(_ car: Car) {
        add(car)

    }
    
    func getAllCars() -> Results<Car> {
        return query(Car.self)
        
    }
    
    func deleteAll() {
        query(Car.self).forEach { car in
            delete(car)
        }
    }
    
    func changePrice(_ objcet: Car){
        
    }
}
