//
//  SectionKey.swift
//  Apple-Frameworks
//
//  Created by indianrenters on 09/07/25.
//

import SwiftUI

struct SectionKey: View {
  let sections = [
    SectionData(title: "Fruits", items: [
      Item(id: "1", title: "Apple"),
      Item(id: "2", title: "Banana"),
      Item(id: "2", title: "ss"),
    ]),
    SectionData(title: "Vegetables", items: [
      Item(id: "3", title: "Carrot"),
      Item(id: "4", title: "Broccoli")
    ])
  ]
  
  struct Item: Identifiable {
    let id: String
    let title: String
  }
  
  struct SectionData {
    let title: String
    let items: [Item]
  }
  
  var body: some View {
    List {
      ForEach(sections, id: \.title) { section in
        Section(header: Text(section.title)
          .font(.system(size: 18, weight: .bold))
          .padding(10)
          .background(Color.gray.opacity(0.2))
        ) {
          ForEach(section.items) { item in
            Text(item.title)
              .padding(10)
//              .overlay(
//                Rectangle()
//                  .frame(height: 1)
//                  .foregroundColor(.gray),
//                alignment: .bottom
//              )
          }
        }
      }
    }
//    .padding(20)
  }
}

#Preview {
   SectionKey()
}

