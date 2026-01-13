//
//  AddEditView.swift
//  BookManager
//
//  Created by Isai Magdaleno Almeraz Landeros on 12/01/26.
//

import SwiftUI

struct AddEditView: View {
	
	// States
	@Binding var book: Book
	@State var workingBook: Book
	@Environment(\.dismiss) private var dismiss

	init(book: Binding<Book>) {
		_book = book
		_workingBook = .init(initialValue: book.wrappedValue)
	}
	
	var body: some View {
		NavigationStack {
			Form {
				Section(header: Text("Book Details")) {
					TextField("Title", text: $workingBook.title)
					TextField("Author", text: $workingBook.author)
					TextEditor(text: $workingBook.details)
						.frame(height: 150)
					
				}
			}
			
			// Tittle
			.navigationTitle(Text("Editing \(book.title)"))
			
			// Toolbar
			.toolbar {
				ToolbarItem(placement: .confirmationAction) {
					// Submit Btn
					Button {
						book.title = workingBook.title
						book.author = workingBook.author
						book.details = workingBook.details
						dismiss()
					} label: {
						Image(systemName: "checkmark")
					}
					.disabled(workingBook.title.isEmpty || (workingBook.author.isEmpty && workingBook.details.isEmpty))
				}
				
				ToolbarItem(placement: .cancellationAction) {
					// Cancel btn
					Button { dismiss() } label: {
						Image(systemName: "xmark")
					}
				}
			}
		}
		
	}
}
