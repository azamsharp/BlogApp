//
//  PostListViewModel.swift
//  BlogApp
//
//  Created by Mohammad Azam on 8/26/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

class PostListViewModel: ObservableObject {
    
    @Published var posts = [PostViewModel]()
    
    func deletePost(_ postVM: PostViewModel) -> Bool {
        
        var deleted = false
        
        do {
            try CoreDataManager.shared.deletePost(post: postVM.post)
            deleted = true
        } catch {
            print(error.localizedDescription)
        }
        
        return deleted
        
    }
    
    func fetchAllPosts() {
        DispatchQueue.main.async {
            self.posts = CoreDataManager.shared.getAllPosts().map(PostViewModel.init)
        }
    }
    
}




class PostViewModel {
    
    var post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    var postId: String {
        
        guard let postId = self.post.postId else {
            return ""
        }
        
        return postId.uuidString
        
    }
    
    var title: String {
        self.post.title ?? ""
    }
    
    var body: String {
        self.post.body ?? ""
    }
    
    var published: Bool {
        self.post.isPublished
    }
    
}
