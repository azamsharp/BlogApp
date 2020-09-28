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
    
    func savePost(post: Post) throws {
        self.moc.insert(post)
        try save()
    }
    
    func deletePost(post: Post) throws {
        self.moc.delete(post)
        try save() 
    }
    
    private func save() throws {
        try self.moc.save()
    }
    
    func getByPostId(postId: UUID) throws -> Post? {
        
        let request: NSFetchRequest<Post> = Post.fetchRequest()
        request.predicate = NSPredicate(format: "postId = %@", (postId.uuidString))
        
        let results = try self.moc.fetch(request)
        return results.first
    }
    
    func updatePost(postId: String, title: String, body: String) throws {
        
        let postToBeUpdated = try getByPostId(postId: UUID(uuidString: postId)!)
        
        if let postToBeUpdated = postToBeUpdated {
            postToBeUpdated.title = title
            postToBeUpdated.body = body
            try save()
        }
        
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
