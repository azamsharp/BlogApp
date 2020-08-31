//
//  AddPostViewModel.swift
//  BlogApp
//
//  Created by Mohammad Azam on 8/31/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

class AddPostViewModel: ObservableObject {
    
    var postTitle: String = ""
    var postBody: String = ""
    
    private var post: Post {
        let post = Post(context: CoreDataManager.shared.moc)
        post.postId = UUID()
        post.title = postTitle
        post.body = postBody
        return post
    }
    
    func savePost() -> Bool {
        
        do {
            try CoreDataManager.shared.savePost(post: post)
            return true
        } catch {
            print(error.localizedDescription)
        }
        
        return false 
        
    }
    
}
