//
//  AddEditView.swift
//  BookManager
//
//  Created by Isai Magdaleno Almeraz Landeros on 12/01/26.
//

import SwiftUI
import SwiftData

struct AddEditView: View {
	
	// States
	var book: PersistantBooks? = nil

	@Environment(\.dismiss) private var dismiss
	@Environment(\.modelContext) private var modelContext
	@State private var title: String = ""
	@State private var author: String = ""
	@State private var genre: Genre = .unknown
	@State private var readingStatus: ReadingStatus = .unknown
	@State private var details: String = ""
	@State private var rating: Int = 0
	@State private var review: String = ""

	init(book: PersistantBooks? = nil) {
		self.book = book
		if let book {
			// edit book values
			_title = State(initialValue: book.title)
			_author = State(initialValue: book.author)
			_genre = State(initialValue: book.genre)
			_readingStatus = State(initialValue: book.readingStatus)
			_details = State(initialValue: book.details)
			_rating = State(initialValue: book.rating)
			_review = State(initialValue: book.review)
		} else {
			// default values
			_title = State(initialValue: "")
			_author = State(initialValue: "")
			_genre = State(initialValue: .unknown)
			_readingStatus = State(initialValue: .unknown)
			_details = State(initialValue: "")
			_rating = State(initialValue: 0)
			_review = State(initialValue: "")
		}
	}
	
	var body: some View {
		NavigationStack {
			Form {
				Section(header: Text("Book Details")) {
					TextField("Title", text: $title)
					
					TextField("Author", text: $author)
					
					Picker("Genre", selection: $genre){
						ForEach(Genre.allCases, id: \.self) { genre in
							Text(genre.rawValue).tag(genre)
						}
					}
					
					Picker("Reading Status", selection: $readingStatus){
						ForEach(ReadingStatus.allCases, id: \.self) { status in
							Text(status.rawValue).tag(status)
						}
					}
					
					
					
					TextEditor(text: $details)
						.frame(height: 150)
					
				}
				
				Section(header: Text("Ratings & Review")) {
					
					StarRatingView(rating: $rating)
					
					TextEditor(text: $review)
						.frame(height: 150)
					
				}
			}
			
			// Tittle
			.navigationTitle(book?.title.isEmpty == false ? "Edit \(book!.title)" : "Add Book")
			
			// Toolbar
			.toolbar {
				ToolbarItem(placement: .confirmationAction) {
					// Submit Btn
					Button {
						let isNewBook = book == nil
						let bookToSave = book ?? PersistantBooks(title:"")
						
						bookToSave.title = title
						bookToSave.author = author
						bookToSave.details = details
						bookToSave.review = review
						bookToSave.rating = rating
						bookToSave.genre = genre
						bookToSave.readingStatus = readingStatus
						
						if isNewBook { modelContext.insert(bookToSave) }
						do { try modelContext.save() } catch { print("Failed to save book: \(error)") }
						dismiss()
					} label: {
						Image(systemName: "checkmark")
					}
					.disabled(title.isEmpty || (author.isEmpty && details.isEmpty))
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

