//
//  BookListView.swift
//  BookManager
//
//  Created by Isai Magdaleno Almeraz Landeros on 17/01/26.
//

import SwiftUI

struct BookListView: View {
	// Variables
	@Binding var books: [Book]
	@State var bookViewModel: BookViewModel
	@State var book: Book = Book(title: "", author: "", details: "", cover: "", review: "", rating: 1)
	
	// States
	@State private var showBookSheet: Bool = false
	@State private var showFilterSheet: Bool = false
	
	// View
    var body: some View {
		// Book List
		NavigationStack {
			// Books list List
			List($books, id: \.self.id) {$book in
				// Navigation to Book
				NavigationLink(destination: BookDetailView(book: $book)) {
					// Book List Item
					BookListItem(book: book)
				}
			}
			.navigationTitle("Books List")
			
			// Toolbar
			.toolbar {
				ToolbarItem(placement: .topBarTrailing) {
					Button(action: { showBookSheet.toggle() }) {
						Image(systemName: "plus")
					}
				}
			}
			
			// Add/Edit book sheet
			.sheet(isPresented: $showBookSheet) {
				if (!book.title.isEmpty) {
					bookViewModel.addBook(book)
				}
				book = Book(title: "", author: "", details: "", cover: "", review: "", rating: 1)
			}
			content: {
				AddEditView(book: $book)
			}
		}
    }
}
