//
//  RatingView.swift
//  Bookworm
//
//  Created by Anmol Chawla on 16/08/24.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var label = ""
    var maximumRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow

    var body: some View {
        HStack(content: {
            if label.isEmpty == false {
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1, id: \.self, content: { number in
                Button(
                    action: { rating = number },
                    label: { image(for: number).foregroundStyle(number > rating ? offColor : onColor) }
                )
            })
        })
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            offImage ?? onImage
        } else {
            onImage
        }
    }
}

#Preview {
    RatingView(rating: .constant(4))
}
