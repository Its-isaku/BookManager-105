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
							.padding(.top, 10)
						
						Spacer()
					}
					.padding(.top, 20)
				}
				
				// Details
				Text(book.details)
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
