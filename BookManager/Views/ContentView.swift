//
//  ContentView.swift
//  BookManager
//
//  Created by Isai Magdaleno Almeraz Landeros on 07/01/26.
//

import SwiftUI

struct ContentView: View {
	// Variables
	var books = [
		Book(
            tittle: "The Fellowship of the Ring",
            author: "J.R.R. Tolkien",
            details: "The first volume of The Lord of the Rings, following Frodo Baggins as he sets out with the Fellowship to destroy the One Ring and thwart Sauron's rise.",
            cover: "lotr_fellowship"	
        ),
		
		Book(
            tittle: "The Two Towers",
            author: "J.R.R. Tolkien",
            details: "The second volume of The Lord of the Rings, chronicling the breaking of the Fellowship, the journey of Frodo and Sam toward Mordor, and the battles that shape Middle-earth's fate.",
            cover: "lotr_towers"
        ),
		
		Book(
            tittle: "The Return of the King",
            author: "J.R.R. Tolkien",
            details: "The concluding volume of The Lord of the Rings, depicting the final struggle against Sauron, the destruction of the One Ring, and the crowning of the true king.",
            cover: "lotr_king"
        ),
	]
	
	
    var body: some View {
		NavigationStack {
			// Books List
			List(books, id: \.self) {book in
				// Navigation to Book
				NavigationLink(destination: BookDetailView(bookInDetailView: book)) {
					HStack {
						Image(book.cover)
							.resizable()
							.scaledToFit()
							.frame(maxWidth: 60, maxHeight: 60)
						
						Text ("\(book.tittle)")
					}
				}
			}
			.navigationTitle(Text("Book Manager"))
		}
    }
}

#Preview {
    ContentView()
}
