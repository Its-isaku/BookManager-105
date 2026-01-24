//
//  ContentView.swift
//  BookManager
//
//  Created by Isai Magdaleno Almeraz Landeros on 07/01/26.
//

import SwiftUI

struct ContentView: View {
	// Variables
	@AppStorage(SETTINGS_THEME_KEY) var theme: Theme = DEFFAULT_SETTINGS_THEME_VALUE
	
	@ObservedObject var booksManager = BookViewModel()
	
    var body: some View {
		TabView {
			
			BookListView(books: $booksManager.books, bookViewModel: booksManager) 
			.tabItem {
				Label("Books", systemImage: "books.vertical.fill")
			}
			
			// Favorites View
			FavoritesView(books: $booksManager.books)
				.tabItem {
					Label("Favorites", systemImage: "heart.fill")
				}
			
			// Settings View
			SettingsView()
				.tabItem {
					Label("Settings", systemImage: "gearshape.fill")
				}
		}
		.preferredColorScheme(theme.colorScheme)
    }
}

#Preview {
    ContentView()
}
