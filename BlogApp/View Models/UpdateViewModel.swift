//
//  UpdateViewModel.swift
//  BlogApp
//
//  Created by Mohammad Azam on 9/4/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

class UpdateViewModel: ObservableObject {
    
    func update(postViewState: PostViewState) {
        
        do {
            try CoreDataManager.shared.updatePost(postId: postViewState.postId, title: postViewState.title, body: postViewState.body)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
}

struct PostViewState {
    var postId: String = ""
    var title: String = ""
    var body: String = ""
}


