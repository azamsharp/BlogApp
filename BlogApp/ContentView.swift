//
//  ContentView.swift
//  BlogApp
//
//  Created by Mohammad Azam on 8/26/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var postListVM = PostListViewModel()
    @State private var isPresented: Bool = false
    
    
    private func deletePost(at indexSet: IndexSet) {
        
        var deleted = false
        
        indexSet.forEach { index in
            let post = postListVM.posts[index]
            deleted = postListVM.deletePost(post)
        }
        
        if deleted {
            postListVM.fetchAllPosts()
        }
        
    }
    
    var body: some View {
        
        VStack {
            
            List {
                ForEach(postListVM.posts, id: \.postId) { post in
                    NavigationLink(destination: PostDetailView(post: post)) {
                        Text(post.title)
                    }
                }.onDelete(perform: self.deletePost)
            }
                
            .onAppear {
                self.postListVM.fetchAllPosts()
            }
            
            .sheet(isPresented: $isPresented, onDismiss: {
                self.postListVM.fetchAllPosts()
            }) {
                AddPostView()
            }
        }
        .navigationBarTitle("Posts")
        .navigationBarItems(trailing: Button("Add Post") {
            self.isPresented = true 
        })
            .embedInNavigationView()
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
