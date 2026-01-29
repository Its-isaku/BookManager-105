//
//  FavoritesView.swift
//  BookManager
//
//  Created by Isai Magdaleno Almeraz Landeros on 17/01/26.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
	
	@Query var books: [PersistantBooks]
	@State private var showFilterSheet: Bool = false
	@State var selectedGenre: Genre? = nil
	@State var selectedReadingStatus: ReadingStatus? = nil
	
	@AppStorage(FAVORITE_GRID_COLUMNS_KEY) var numberOfColumns: Int = FAVORITE_GRID_COLUMNS_KEY_DEFAULT

	private var layout: [GridItem] {
		Array(repeating: GridItem(.flexible()), count: numberOfColumns)
	}
	
	// computed property: bindings to favorite books
	private var favoriteBooks: [PersistantBooks] {
		books.filter { book in
			return book.isFavorite
			&& (selectedGenre == nil || book.genre == selectedGenre)
			&& (selectedReadingStatus == nil || book.readingStatus == selectedReadingStatus)
		}
	}
	
    var body: some View {
		// Book List
		NavigationStack {
			ScrollView {
				LazyVGrid(columns: layout) {
					ForEach(favoriteBooks, id: \.self.id) { book in
						NavigationLink(destination: BookDetailView(book: book)) {
							FavoriteCard(book: book)
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

