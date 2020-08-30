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
    
    var body: some View {
        
        List(postListVM.posts, id: \.title) { post in
            Text(post.title)
        }
        
            .onAppear {
                self.postListVM.fetchAllPosts()
        }
        
    }
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
