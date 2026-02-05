//
//  FavoritesView.test.swift
//  BookManager
//
//  Created by Isai Magdaleno Almeraz Landeros on 04/02/26.
//

import Testing
@testable import BookManager


@MainActor @Suite("Favorite View Testing")
struct FavoritesViewTests {
	
	@Test("No filter is applied")
	func noFilterApplied() {
		
		// Arrange
		let books: [PersistantBooks] = []
		
		// Act
		let filteredBooks = filterFavoriteBooks(books: books)
		
		// Assert
		#expect(filteredBooks.isEmpty)
	}
	
	@Test("Filter Books with favorites")
	func filterBooksWithFavorites() {
		// Arrange
		let books = [
			PersistantBooks(title: "Book 1"),
			PersistantBooks(title: "Book 2", isFavorite: true),
			PersistantBooks(title: "Book 3", genre: .fantasy),
			PersistantBooks(title: "Book 4", genre: .horror, isFavorite: true),
		]

		// Act
		let filteredBooks = filterFavoriteBooks(books: books)

		// Assert
		#expect(filteredBooks.count == 2)
	}

	@Test("Filter Books by Genre")
	func filterBooksByGenre() {
		// Arrange
		let books = [
			PersistantBooks(title: "Book 1", genre: .fantasy, isFavorite: true),
			PersistantBooks(title: "Book 2", genre: .horror, isFavorite: true),
			PersistantBooks(title: "Book 3", genre: .fantasy, isFavorite: true),
			PersistantBooks(title: "Book 4", genre: .fantasy, isFavorite: false),
		]

		// Act
		let filteredBooks = filterFavoriteBooks(books: books, selectedGenre: .fantasy)

		// Assert
		#expect(filteredBooks.count == 2)
		#expect(filteredBooks.allSatisfy { $0.genre == .fantasy })
	}

	@Test("Filter Books by Reading Status")
	func filterBooksByReadingStatus() {
		// Arrange
		let books = [
			PersistantBooks(title: "Book 1", readingStatus: .reading, isFavorite: true),
			PersistantBooks(title: "Book 2", readingStatus: .finished, isFavorite: true),
			PersistantBooks(title: "Book 3", readingStatus: .reading, isFavorite: true),
			PersistantBooks(title: "Book 4", readingStatus: .reading, isFavorite: false),
		]

		// Act
		let filteredBooks = filterFavoriteBooks(books: books, selectedReadingStatus: .reading)

		// Assert
		#expect(filteredBooks.count == 2)
		#expect(filteredBooks.allSatisfy { $0.readingStatus == .reading })
	}
}

