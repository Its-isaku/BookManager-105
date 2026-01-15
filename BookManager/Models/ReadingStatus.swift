//
//  ReadingStatus.swift
//  BookManager
//
//  Created by Isai Magdaleno Almeraz Landeros on 14/01/26.
//

import Foundation

enum ReadingStatus: String, Codable, CaseIterable {
	case whantToRead = "Want to Read"
	case reading = "Reading"
	case dropped = "Dropped"
	case finished = "Finished"
	
	// base case
	case unknown = "Unknown"
}
