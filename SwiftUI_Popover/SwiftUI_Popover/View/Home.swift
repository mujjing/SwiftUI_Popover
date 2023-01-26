//
//  Home.swift
//

import SwiftUI

struct Home: View {
    /// View Properties
    @State private var showPopover: Bool = false
    
    var body: some View {
        Button {
            showPopover.toggle()
        } label: {
            Text("Show Popover")
        }
        .iOSPopover(isPresented: $showPopover, arrowDirection: .up) {
            Text("이것은 팝 오버 입니다")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


extension View {
    @ViewBuilder
    func iOSPopover<Content: View>(isPresented: Binding<Bool>, arrowDirection: UIPopoverArrowDirection, @ViewBuilder content: @escaping () -> Content) -> some View {
        self
            .background {
                
            }
    }
}
