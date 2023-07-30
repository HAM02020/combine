//
//  BaseDAO.swift
//  RealmDemo
//
//  Created by my on 2023/7/30.
//

import Foundation
import RealmSwift

fileprivate protocol BaseDAO{
    associatedtype T: Object
    func add(_ object: T)
    func delete(_ object: T)
    func update(_ closure: ()->Void)
    func query(_ type: T.Type, _ filterString: String?) -> Results<T>
}


class RealmDAO<T:Object>: BaseDAO{
    // 增
    internal func add(_ object: T){
        let realm = try! Realm()
        try! realm.write{
            realm.add(object)
        }
    }
    // 删
    internal func delete(_ object: T){
        let realm = try! Realm()
        try! realm.write{
            realm.delete(object)
        }
    }
    // 改
    internal func update(_ closure: ()->Void){
        let realm = try! Realm()
        try! realm.write(closure)
    }
    // 查
    internal func query(_ type: T.Type, _ filterString: String? = nil) -> Results<T>{
        let realm = try! Realm()
        var res: Results<T> = realm.objects(type)
        if let filterString{
            res = res.filter(filterString)
        }
        return res
    }
    
    
}
