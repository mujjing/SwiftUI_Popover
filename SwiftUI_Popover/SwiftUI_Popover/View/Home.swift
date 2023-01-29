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
                PopOverController(isPresented: isPresented, arrowDirection: arrowDirection, content: content())
            }
    }
}

struct PopOverController<Content: View>: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    var arrowDirection: UIPopoverArrowDirection
    var content: Content
    
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
        controller.view.backgroundColor = .clear
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if isPresented {
            /// presenting popover
            let controller = UIHostingController(rootView: content)
            controller.view.backgroundColor = .clear
            controller.modalPresentationStyle = .popover
            controller.popoverPresentationController?.permittedArrowDirections = arrowDirection
            
            controller.popoverPresentationController?.sourceView = uiViewController.view
            uiViewController.present(controller, animated: true)
        }
    }
    
    
}
