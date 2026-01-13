//
//  Book.swift
//  BookManager
//
//  Created by Isai Magdaleno Almeraz Landeros on 07/01/26.
//

import Foundation

struct Book: Hashable {
	let id: UUID = UUID()
	var title: String
	var author: String
	var details: String
	var cover: String
}
