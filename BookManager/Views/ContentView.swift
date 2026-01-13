//
//  ContentView.swift
//  BookManager
//
//  Created by Isai Magdaleno Almeraz Landeros on 07/01/26.
//

import SwiftUI

struct ContentView: View {
	// Variables
	@State var books = getBooks()
	@State var book: Book = Book(title: "", author: "", details: "", cover: "")
	
	// States
	@State private var showBookSheet: Bool = false
	
    var body: some View {
		NavigationStack {
			// Books List
			List($books, id: \.self.id) {$book in
				// Navigation to Book
				NavigationLink(destination: BookDetailView(book: $book)) {
					HStack {
						Image(book.cover)
							.resizable()
							.scaledToFit()
							.frame(maxWidth: 60, maxHeight: 60)
						
						Text ("\(book.title)")
					}
				}
			}
			// Toolbar
			.toolbar {
				ToolbarItem(placement: .topBarTrailing) {
					Button(action: { showBookSheet.toggle() }) {
						Image(systemName: "plus")
					}
				}
			}
			
			// Edit book sheet
			.sheet(isPresented: $showBookSheet) {
				if (!book.title.isEmpty) {
					books.append(book)
				}
				book = Book(title: "", author: "", details: "", cover: "")
			}
			content: {
				AddEditView(book: $book)
			}
		}
    }
}

#Preview {
    ContentView()
}
