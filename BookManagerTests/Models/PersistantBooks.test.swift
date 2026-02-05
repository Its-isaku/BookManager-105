//
//  PersistantBooks.test.swift
//  BookManager
//
//  Created by Isai Magdaleno Almeraz Landeros on 04/02/26.
//

import Testing

@testable import BookManager

@MainActor @Suite("Persistant Books test")
struct PersistantBooksTests {
	@Test("Persistent book init")
	func persistentBookInit() {
		
		// Arrange
		let anyTitle: String = "Test Book"
		let anyAuthor: String = "Author Name"
		
		// Act
		let book = PersistantBooks(title: anyTitle, author: anyAuthor)
		
		// Assert
		#expect(book.title == "Test Book")
		#expect(book.author == "Author Name")

		
	}
}

