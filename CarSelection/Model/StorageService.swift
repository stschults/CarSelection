//
//  StorageService.swift
//  CarSelection
//
//  Created by Станислав Шульц on 07.08.2023.
//

import Foundation
import RealmSwift

final class StorageService {
    
    private let storage: Realm?
    
    init (_ configuration: Realm.Configuration = Realm.Configuration.defaultConfiguration) {
        self.storage = try? Realm(configuration: configuration)
    }
    
    func saveOrUpdateObject(object: Object) throws {
        guard let storage else { return }
        storage.writeAsync {
            storage.add(object, update: .all)
        }
    }
    
    func saveOrUpdateAllObjects(objects: [Object]) throws {
        try objects.forEach {
            try saveOrUpdateObject(object: $0)
        }
    }
    
    func delete(object: Object) throws {
        guard let storage else { return }
        try storage.write {
            storage.delete(object)
        }
    }
    
    func deleteAll() throws {
        guard let storage else { return }
        try storage.write {
            storage.deleteAll()
        }
    }
    
    func fetch<T: Object>(by type: T.Type) -> [T] {
        guard let storage else {return [] }
        return storage.objects(T.self).toArray()
    }
}

extension Results {
    func toArray() -> [Element] {
        .init(self)
    }
}
