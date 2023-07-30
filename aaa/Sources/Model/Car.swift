//
//  Car.swift
//  aaa
//
//  Created by my on 2023/7/28.
//

import Foundation
import RealmSwift

class Car: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    
    @Persisted() var name: String
    
    @Persisted var price: Int

}
