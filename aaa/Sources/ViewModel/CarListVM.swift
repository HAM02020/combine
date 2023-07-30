//
//  CarListVM.swift
//  RealmDemo
//
//  Created by my on 2023/7/28.
//

import Foundation
import RealmSwift

typealias VoidCallback = ()->Void

@MainActor
class CarListVM {

    
    @Published
    var cars: [Car] = []
    
    var carService: CarService
    
    init() {
        carService = CarService()
        carService.deleteAll()
        //cars = carService.getAllCars()
        
    }
    

    
    func fetchCars() async{
        do{
            try await Task.sleep(for: .seconds(3))
            for i in 0 ..< 3{
                let car = Car()
                car.name = "car\(i)"
                car.price = i * 1000
                carService.addCar(car)
            }
            
            cars = carService.getAllCars()

            
        }catch{
        }
        
        
        
    }
    
}
