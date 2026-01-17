//
//  ContentView.swift
//  BookManager
//
//  Created by Isai Magdaleno Almeraz Landeros on 07/01/26.
//

import SwiftUI

struct ContentView: View {
	// Variables
	@State var books = getBooks()
	
    var body: some View {
		TabView {
			
			BookListView(books: $books)
			.tabItem {
				Label("Books", systemImage: "books.vertical.fill")
			}
			
			// Favorites View
			FavoritesView(books: $books)
				.tabItem {
					Label("Favorites", systemImage: "heart.fill")
				}
		}
    }
}

#Preview {
    ContentView()
}
