//
//  AddPostView.swift
//  BlogApp
//
//  Created by Mohammad Azam on 8/31/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct AddPostView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var addPostVM = AddPostViewModel()
    
    var body: some View {
        VStack {
            TextField("Title", text: $addPostVM.postTitle)
            TextField("Body", text: $addPostVM.postBody)
            Button("Save") {
                let saved = self.addPostVM.savePost()
                if saved {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }.padding()
    }
}

struct AddPostView_Previews: PreviewProvider {
    static var previews: some View {
        AddPostView()
    }
}
