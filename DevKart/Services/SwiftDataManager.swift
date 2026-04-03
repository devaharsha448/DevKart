import SwiftData
import SwiftUI

final class SwiftDataManager {
    
    
    func add<T: PersistentModel>(_ item: T, context: ModelContext) {
        context.insert(item)
    }
    
    
    func delete<T: PersistentModel>(_ item: T, context: ModelContext) {
        context.delete(item)
    }
    
    
    func fetch<T: PersistentModel>(
        _ type: T.Type,
        context: ModelContext,
        predicate: Predicate<T>? = nil,
        sortBy: [SortDescriptor<T>] = []
    ) -> [T] {
        do {
            let descriptor = FetchDescriptor<T>(
                predicate: predicate,
                sortBy: sortBy
            )
            return try context.fetch(descriptor)
        } catch {
            print("Fetch failed: \(error)")
            return []
        }
    }
    
    
    func deleteAll<T: PersistentModel>(_ type: T.Type, context: ModelContext) {
        let items = fetch(type, context: context)
        items.forEach { context.delete($0) }
    }
}












//import SwiftData
//
//final class SwiftDataManager {
//    
//
//    func addUser(name: String, age: Int, context: ModelContext) {
//        let user = User(name: name, age: age)
//        context.insert(user)
//    }
//    
//
//    func deleteUser(user: User, context: ModelContext) {
//        context.delete(user)
//    }
//    
//    // UPDATE
//    func updateUser(user: User, name: String, age: Int) {
//        user.name = name
//        user.age = age
//    }
//}
