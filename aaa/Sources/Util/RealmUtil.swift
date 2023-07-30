//
//  RealmUtil.swift
//  aaa
//
//  Created by my on 2023/7/28.
//

import Foundation
import RealmSwift

class RealmUtil{
    
    static let `defalut` = RealmUtil()
    
    var fileURL: URL?{
        return Realm.Configuration.defaultConfiguration.fileURL
    }
    
    
    // 增
    func add<T:Object>(_ object: T){
        let realm = try! Realm()
        try! realm.write{
            realm.add(object,update: .modified)
        }
    }
    // 删
    func delete<T:Object>(_ object: T){
        let realm = try! Realm()
        try! realm.write{
            realm.delete(object)
        }
    }
    // 改
    func update(_ closure: ()->Void){
        let realm = try! Realm()
        try! realm.write(closure)
    }
    // 查
    func query<T:Object>(_ type: T.Type, _ filterString: String? = nil) -> Results<T>{
        let realm = try! Realm()
        var res: Results<T> = realm.objects(type)
        if let filterString{
            res = res.filter(filterString)
        }
        return res
    }
}
