//
//  CoreDataViewModel.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 19/12/24.
//

import Foundation
import CoreData

class CoreDataViewModel: ObservableObject {
    
    static var shared = CoreDataViewModel()
    
    let container: NSPersistentContainer
    @Published var queries: [Queries] = []
    
    private init() {
        container = NSPersistentContainer(name: "Models")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("error in loading Core Data \(error)")
            }
        }
    }
    
    func fetchQueries() -> Void {
        let request = NSFetchRequest<Queries>(entityName: "QueriesEntity")
        
        do {
            queries = try container.viewContext.fetch(request)
        } catch let error {
            print("Error Fetching: \(error)")
        }
    }
    
    func saveData() -> Void {
        do {
            try container.viewContext.save()
            fetchQueries()
        } catch let error {
            print("\(error)")
        }
    }
    
    func addNewQuery(title: String) -> Void {
        let newQuery = Queries(context: container.viewContext)
        newQuery.title = title
        newQuery.id = Int64.random(in: 1...1000000)
        saveData()
    }
}
