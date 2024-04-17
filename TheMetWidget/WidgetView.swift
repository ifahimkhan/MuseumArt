
import SwiftUI
import WidgetKit

struct WidgetView: View {
  let entry: Provider.Entry
  var body: some View {
    VStack {
          Text("The Met")  // 1
            .font(.headline)
            .padding(.top)
          Divider()  // 2

          if !entry.object.isPublicDomain {  // 3
            WebIndicatorView(title: entry.object.title)
              .padding()
              .background(Color.metBackground)
              .foregroundColor(.white)
          } else {
            DetailIndicatorView(title: entry.object.title)
              .padding()
              .background(Color.metForeground)
          }
        }
        .truncationMode(.middle)  // 4
        .fontWeight(.semibold)
        .widgetURL(URL(string: "themet://\(entry.object.objectID)"))
      }
}

struct WidgetView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      WidgetView(
        entry: SimpleEntry(
          date: Date(),
          object: Object.sample(isPublicDomain: true)))
      .previewContext(WidgetPreviewContext(family: .systemLarge))
      WidgetView(
        entry: SimpleEntry(
          date: Date(),
          object: Object.sample(isPublicDomain: false)))
      .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
  }
}
struct DetailIndicatorView: View {
  let title: String
  var body: some View {
    HStack(alignment: .firstTextBaseline) {
      Text(title)
      Spacer()
      Image(systemName: "doc.text.image.fill")
} }
}
