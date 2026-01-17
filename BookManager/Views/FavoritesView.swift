//
//  FavoritesView.swift
//  BookManager
//
//  Created by Isai Magdaleno Almeraz Landeros on 17/01/26.
//

import SwiftUI

struct FavoritesView: View {
	
	@Binding var books: [Book]

	let layout = [GridItem(.flexible()), GridItem(.flexible())]
	
	// computed property: bindings to favorite books
	private var favoriteBooks: [Binding<Book>] {
		$books.filter { $0.wrappedValue.isFavorite }
	}
	
    var body: some View {
		// Book List
		NavigationStack {
			ScrollView {
				LazyVGrid(columns: layout) {
					ForEach(favoriteBooks, id: \.self.wrappedValue.id) { book in
						NavigationLink(destination: BookDetailView(book: book)) {
							FavoriteCard(book: book.wrappedValue)
						}
					}
				}
				.padding()
			}
		}
	}
}

