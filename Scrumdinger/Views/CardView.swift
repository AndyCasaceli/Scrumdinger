//
//  CardView.swift
//  Scrumdinger
//
//  Created by Andy Casaceli on 12/18/20.
//

import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel(Text("Attendees"))
                    .accessibility(label: Text("\(scrum.attendees.count)"))
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .padding(.trailing, 20)
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel(Text("Meeting Length"))
                    .accessibility(label: Text("\(scrum.lengthInMinutes) minutes"))
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(scrum.color.accessibleFontColor)
    }
}

struct CardView_Previews: PreviewProvider {
    static var scrum = DailyScrum.data[0]
    static var scrums = DailyScrum.data

    static var previews: some View {
        CardView(scrum: scrum)
            .background(scrum.color)
            .previewLayout(.sizeThatFits)
        
        CardView(scrum: scrums[1])
            .background(scrums[1].color)
            .previewLayout(.sizeThatFits)
        
        CardView(scrum: scrums[2])
            .background(scrums[2].color)
            .previewLayout(.sizeThatFits)
    }
}
