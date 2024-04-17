

import SwiftUI

struct WebIndicatorView: View {
  let title:String
  var body: some View {
    HStack {
      Text(title)
      Spacer()
      Image(systemName: "rectangle.portrait.and.arrow.right.fill")
        .font(.footnote)
    }
  }
}
struct PlaceholderView: View {
  let note: String
  var body: some View {
    ZStack {
      Rectangle()
        .inset(by: 7)
        .fill(Color.metForeground)
        .border(Color.metBackground, width: 7)
        .padding()
      Text(note)
        .foregroundColor(.metBackground)
    }
  }
}

