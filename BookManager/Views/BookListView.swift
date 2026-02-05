//
//  BookListView.swift
//  BookManager
//
//  Created by Isai Magdaleno Almeraz Landeros on 17/01/26.
//

import SwiftUI
import SwiftData

struct BookListView: View {
	// Variables
	@Query var books: [PersistantBooks]
	@State var book: Book = Book(title: "", author: "", details: "", cover: "", review: "", rating: 1)
	
	// States
	@State private var showBookSheet: Bool = false
	@State private var showFilterSheet: Bool = false
	
	// View
    var body: some View {
		// Book List
		NavigationStack {
			// Books list List
			List(books, id: \.id) { book in
				// Navigation to Book
				NavigationLink(destination: BookDetailView(book: book)) {
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
					}.accessibilityLabel("Add book")
				}
			}
			
//			 Add/Edit book sheet
			.sheet(isPresented: $showBookSheet) {
				AddEditView()
			}
		}
    }
}

