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
