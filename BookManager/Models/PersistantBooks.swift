//
//  PersistantBooks.swift
//  BookManager
//
//  Created by Isai Magdaleno Almeraz Landeros on 26/01/26.
//

import Foundation
import SwiftData

@Model
class PersistantBooks {
	
	var title: String
	var author: String
	var details: String
//	var cover: String
	var review: String
	var rating: Int
	var genre: Genre = Genre.unknown
	var readingStatus: ReadingStatus = ReadingStatus.unknown
	var isFavorite: Bool = false
	
	init(title: String, author: String = "", details: String = "",
//		 cover = "",
	review: String = "", rating: Int = 0, genre: Genre = .unknown, readingStatus: ReadingStatus = .unknown, isFavorite: Bool = false) {
		self.title = title
		self.author = author
		self.details = details
//		self.cover = cover
		self.review = review
		self.rating = rating
		self.genre = genre
		self.readingStatus = readingStatus
		self.isFavorite = isFavorite
	}
}

