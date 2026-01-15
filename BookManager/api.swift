//
//  api.swift
//  BookManager
//
//  Created by Isai Magdaleno Almeraz Landeros on 12/01/26.
//

import Foundation

// Function to return books
func getBooks() -> [Book] {
	return [
		Book(
			title: "The Fellowship of the Ring",
			author: "J.R.R. Tolkien",
			details: "The first volume of The Lord of the Rings, following Frodo Baggins as he sets out with the Fellowship to destroy the One Ring and thwart Sauron's rise.",
			cover: "lotr_fellowship",
			review: "test review",
			rating: 5,
			genre: .fantasy,
			readingStatus: .finished
		),
		
		Book(
			title: "The Two Towers",
			author: "J.R.R. Tolkien",
			details: "The second volume of The Lord of the Rings, chronicling the breaking of the Fellowship, the journey of Frodo and Sam toward Mordor, and the battles that shape Middle-earth's fate.",
			cover: "lotr_towers",
			review: "test review",
			rating: 5,
			genre: .fantasy,
			readingStatus: .finished
		),
		
		Book(
			title: "The Return of the King",
			author: "J.R.R. Tolkien",
			details: "The concluding volume of The Lord of the Rings, depicting the final struggle against Sauron, the destruction of the One Ring, and the crowning of the true king.",
			cover: "lotr_king",
			review: "test review",
			rating: 5,
			genre: .fantasy,
			readingStatus: .finished
		),
	]
}
