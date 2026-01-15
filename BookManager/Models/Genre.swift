//
//  Genre.swift
//  BookManager
//
//  Created by Isai Magdaleno Almeraz Landeros on 14/01/26.
//

import Foundation

enum Genre: String, Codable, CaseIterable {
	case classic = "Clásic"
	case fantasy = "Fantacy"
	case scienceFiction = "Science Fiction"
	case horror = "Horror"
	
	// base case
	case unknown = "Unknown"
}
