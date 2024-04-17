

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
  func placeholder(in context: Context) -> SimpleEntry {
    SimpleEntry(date: Date(),object:Object.sample(isPublicDomain: true))
  }

  func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
    let entry = SimpleEntry(date: Date(),object:Object.sample(isPublicDomain: true))
    completion(entry)
  }


  func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> Void) {
    var entries: [SimpleEntry] = []

    // Generate a timeline consisting of five entries an hour apart, starting from the current date.
    let currentDate = Date()
    let interval = 3

    let objects = readObjects()
    for index in 0 ..< objects.count {
      let entryDate = Calendar.current.date(
        byAdding: .second,
        value: index * interval,
        // swiftlint:disable:next force_unwrapping
        to: currentDate)!
      let entry = SimpleEntry(
        date: entryDate,
        object: objects[index])
      entries.append(entry)
    }

    let timeline = Timeline(entries: entries, policy: .never)
    completion(timeline)
  }

  func readObjects() -> [Object] {
    var objects: [Object] = []
    let archiveURL =
    FileManager.sharedContainerURL()
      .appendingPathComponent("objects.json")
    print(">>> \(archiveURL)")

    if let codeData = try? Data(contentsOf: archiveURL) {
      do {
        objects = try JSONDecoder()
          .decode([Object].self, from: codeData)
      } catch {
        print("Error: Can’t decode contents")
      }
    }
    return objects
  }

}

struct SimpleEntry: TimelineEntry {
  let date: Date
  let object: Object
}

struct TheMetWidgetEntryView : View {
  var entry: Provider.Entry

  var body: some View {
    Text(entry.date, style: .time)
  }
}

struct TheMetWidget: Widget {
  let kind: String = "TheMetWidget"

  var body: some WidgetConfiguration {
    StaticConfiguration(kind: kind, provider: Provider()) { entry in
      TheMetWidgetEntryView(entry: entry)
    }
    .configurationDisplayName("The Met")
    .description("View Object is from metropolitian museum")
  }
}

struct TheMetWidget_Previews: PreviewProvider {
  static var previews: some View {
    TheMetWidgetEntryView(entry: SimpleEntry(date: Date(),object:Object.sample(isPublicDomain: true)))
      .previewContext(WidgetPreviewContext(family: .systemSmall))
  }
}
