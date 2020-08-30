//
//  CoreDataManager.swift
//  BlogApp
//
//  Created by Mohammad Azam on 8/26/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {

    static let shared = CoreDataManager(moc: NSManagedObjectContext.current)
    
    var moc: NSManagedObjectContext
    
    private init(moc: NSManagedObjectContext) {
        self.moc = moc
    }
    
    func getAllPosts() -> [Post] {
        
        var posts = [Post]()
        
        let request: NSFetchRequest<Post> = Post.fetchRequest()
        
        do {
            posts = try self.moc.fetch(request)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        return posts
        
    }
    
}
