//
//  NewtrailView.swift
//  Apprutas
//
//  Created by Дарья Любивая on 04.03.2025.
//

import SwiftUI

struct Point: Identifiable {
    let id = UUID()
    var name: String
    var info: String
    var link: String
}

struct NewtrailView: View {
    @State var points = [
        Point(name: "", info: "", link: "")
    ]
    var body: some View {
        ForEach(points) { point in
            VStack(alignment: .leading) {
                Text("Name: " + point.name)
                Text("Info: " + point.info)
                Text("Link: " + point.link)
            }
        }
        Button(action: {
            points.append(Point(name: "", info: "", link: ""))
        }) {
            Text("Новая точка")
        }
    }
}

#Preview {
    NewtrailView()
}
