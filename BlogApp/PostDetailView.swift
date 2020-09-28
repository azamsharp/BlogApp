//
//  PostDetailView.swift
//  BlogApp
//
//  Created by Mohammad Azam on 9/4/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct PostDetailView: View {
    
    let post: PostViewModel
    @ObservedObject private var updateVM = UpdateViewModel()
    @State private var postViewState = PostViewState()
    
    var body: some View {
        VStack {
            
            TextField(post.title, text: $postViewState.title)
            TextField(post.body, text: $postViewState.body)
            
            Button("Update") {
                self.postViewState.postId = self.post.postId
                self.updateVM.update(postViewState: self.postViewState)
            }
            
            .onAppear {
                self.postViewState.title = self.post.title
                self.postViewState.body = self.post.body
            }
           
        }
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let post = Post()
        return PostDetailView(post: PostViewModel(post: post))
    }
}
