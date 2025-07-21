//
//  LandingView.swift
//  Apple-Frameworks
//
//  Created by indianrenters on 17/06/25.
//

import SwiftUI

struct LandingView: View {
    @State private var selectedTab: Int = 0
    
    var body: some View {
       ZStack(alignment: .bottom) {
            // Content
            TabView(selection: $selectedTab) {
                NavigationStack {
                    ConceptView()
                }
                .tag(0)
                
                NavigationStack {
                    VStack {
                       AppMainView()
                    }
                }
                .tag(1)
                
                NavigationStack {
                    VStack {
                       ProfileView()
                    }
                }
                .tag(2)
            }
            
            CapsuleTabBar(selectedTab: $selectedTab)
                .padding(.horizontal, 16)
        }
       .ignoresSafeArea(.keyboard)
    }
}

struct CapsuleTabBar: View {
    @Binding var selectedTab: Int
    private let tabs: [TabItem] = [
        TabItem(title: "Concepts", icon: "rainbow"),
        TabItem(title: "Apps", icon: "storefront"),
        TabItem(title: "Settings", icon: "gear")
    ]
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(tabs.indices, id: \.self) { index in
                Button(action: {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                        selectedTab = index
                    }
                }) {
                    CapsuleTabItem(
                        title: tabs[index].title,
                        icon: tabs[index].icon,
                        isSelected: selectedTab == index
                    )
                }
            }
        }
        .frame(height: 60)
        .background(
            ZStack {
                Capsule()
                    .fill(Color(.systemBackground))
                    .shadow(color: Color.black.opacity(0.15), radius: 10, x: 5, y: 5)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            }
        )
        .overlay(
            Capsule()
                .stroke(Color.gray.opacity(0.2), lineWidth: 0.5)
        )
    }
}

struct CapsuleTabItem: View {
    let title: String
    let icon: String
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 20, weight: .medium))
                
            Text(title)
                .font(.caption2)
                .fontWeight(.semibold)
        }
        .foregroundColor(isSelected ? .accentColor : .gray)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
        .background(
            ZStack {
                if isSelected {
                    Capsule()
                        .fill(Color(.systemBackground))
                        .matchedGeometryEffect(id: "selectedTab", in: namespace)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: -3, y: -3)
                        .shadow(color: Color.white.opacity(0.7), radius: 5, x: 3, y: 3)
                }
            }
        )
        .scaleEffect(isSelected ? 1.05 : 1.0)
        .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isSelected)
    }
    
    @Namespace private var namespace
}

struct TabItem {
    let title: String
    let icon: String
}

#Preview {
   LandingView()
}
