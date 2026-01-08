//
//  BookDetailView.swift
//  BookManager
//
//  Created by Isai Magdaleno Almeraz Landeros on 07/01/26.
//

import SwiftUI

struct BookDetailView: View {
    // Variables
	var bookInDetailView: Book
	
	var body: some View {
		
		ScrollView {
			VStack(alignment: .leading) {
				// Book main Info
				HStack {
					// Imagea
					Image(bookInDetailView.cover)
						.resizable()
						.scaledToFit()
						.frame(width: 150, height: 200)
						.padding(.vertical, 20)
					
					VStack(alignment: .leading) {
						// Title
						Text(bookInDetailView.tittle)
							.font(Font.largeTitle)
						
						// Author
						Text(bookInDetailView.author)
							.font(Font.headline)
							. foregroundStyle(.secondary)
							.padding(.top, 10)
						
						Spacer()
					}
					.padding(.top, 20)
				}
				
				// Details
				Text(bookInDetailView.details)
			}
			.padding(20)
		}
    }
}
