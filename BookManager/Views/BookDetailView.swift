//
//  BookDetailView.swift
//  BookManager
//
//  Created by Isai Magdaleno Almeraz Landeros on 07/01/26.
//

import SwiftUI

struct BookDetailView: View {
    // Variables
	@Binding var book: Book
	
	// States
	@State private var showEditSheet: Bool = false
	
	var body: some View {
		
		ScrollView {
			VStack(alignment: .leading) {
				// Book main Info
				HStack {
					// Imagea
					Image(book.cover)
						.resizable()
						.scaledToFit()
						.frame(width: 150, height: 200)
						.padding(.vertical, 20)
					
					VStack(alignment: .leading) {
						// Title
						Text(book.title)
							.font(Font.largeTitle)
						
						// Author
						Text(book.author)
							.font(Font.headline)
							.foregroundStyle(.secondary)
							.padding(.top, 5)
						HStack(spacing: 10) {
							// Genre
							CustomCapsule(text: book.genre.rawValue, color: .blue)

							// Reading Status
							CustomCapsule(text: book.readingStatus.rawValue, color: .red)
						}
						
						Spacer()
					}
					.padding(.top, 20)
				}
				
				// Details
				Text(book.details)
				
				HStack(spacing: 10){
					Text("Review")
						.font(.title2.bold())
						.padding(.vertical, 2)
					
					// show stars depending the rating
					HStack(spacing: 2) {
						ForEach(0..<5, id: \.self) { star in
							Image(systemName: star < book.rating ? "star.fill" : "star")
								.foregroundColor(Color.yellow)
						}
					}
					
					Spacer()
					
					// Add to favorite Toggle
					FavoriteToggle(isFavorite: $book.isFavorite)
					
				}
				
				
				Text(book.review)
					.font(.subheadline)
					.padding(.vertical)
				
			}
			.padding(20)
		}
		
		// Toolbar
		.toolbar {
		    ToolbarItem(placement: .topBarTrailing) {
		        Button(action: { showEditSheet.toggle() }) {
		            Image(systemName: "pencil")
		        }
		    }
		}
		
		// Edit book sheet
		.sheet(isPresented: $showEditSheet) {
			AddEditView(book: $book)
		}
    }
}

