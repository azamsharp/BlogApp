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
    
    var body: some View {
        
        VStack {
            
            List(postListVM.posts, id: \.title) { post in
                Text(post.title)
            }
                
            .onAppear {
                self.postListVM.fetchAllPosts()
            }
            
            .sheet(isPresented: $isPresented, onDismiss: {
                
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
