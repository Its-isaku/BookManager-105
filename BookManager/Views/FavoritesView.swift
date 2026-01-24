//
//  FavoritesView.swift
//  BookManager
//
//  Created by Isai Magdaleno Almeraz Landeros on 17/01/26.
//

import SwiftUI

struct FavoritesView: View {
	
	@Binding var books: [Book]
	@State private var showFilterSheet: Bool = false
	@State var selectedGenre: Genre? = nil
	@State var selectedReadingStatus: ReadingStatus? = nil
	
	@AppStorage(FAVORITE_GRID_COLUMNS_KEY) var numberOfColumns: Int = FAVORITE_GRID_COLUMNS_KEY_DEFAULT

	private var layout: [GridItem] {
		Array(repeating: GridItem(.flexible()), count: numberOfColumns)
	}
	
	// computed property: bindings to favorite books
	private var favoriteBooks: [Binding<Book>] {
		$books.filter {
			let value = $0.wrappedValue
			return value.isFavorite
			&& (selectedGenre == nil || value.genre == selectedGenre)
			&& (selectedReadingStatus == nil || value.readingStatus == selectedReadingStatus)
		}
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
			.navigationTitle("My Favorite Books")
			.toolbar {
				ToolbarItem(placement: .topBarLeading) {
					Button (action: {showFilterSheet.toggle()}) {
						Image(systemName: "line.horizontal.3.decrease.circle")
					}
				}
			}
			.sheet(isPresented: $showFilterSheet) {
				FilterView(
					selectedGenre: $selectedGenre,
					selectedReadingStatus: $selectedReadingStatus
				)
			}
		}
	}
}

