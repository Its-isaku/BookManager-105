//
//  BookListItem.swift
//  BookManager
//
//  Created by Isai Magdaleno Almeraz Landeros on 14/01/26.
//

import SwiftUI

struct BookListItem: View {
	let book: PersistantBooks
	
    var body: some View {
		
		// Book List Structure
		HStack {
			Image(uiImage: book.cover != nil ? UIImage(data: book.cover!)! : UIImage(resource: .lotrFellowship))
				.resizable()
				.scaledToFit()
				.frame(maxWidth: 60, maxHeight: 60)
			
			Text ("\(book.title)")
			
			Spacer()
			
			Text(book.isFavorite ? "❤️" : "")
		}
		
    }
}
