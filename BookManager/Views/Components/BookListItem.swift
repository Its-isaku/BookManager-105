//
//  BookListItem.swift
//  BookManager
//
//  Created by Isai Magdaleno Almeraz Landeros on 14/01/26.
//

import SwiftUI

struct BookListItem: View {
	let book: Book
	
    var body: some View {
		
		// Book List Structure
		HStack {
			Image(book.cover)
				.resizable()
				.scaledToFit()
				.frame(maxWidth: 60, maxHeight: 60)
			
			Text ("\(book.title)")
		}
		
    }
}
