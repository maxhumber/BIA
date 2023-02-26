import UIKit
import SwiftUI

extension UIViewController {
    public static func preview() -> some View {
        UIViewContainer {
            Self()
        }
    }
    
    public func preview() -> some View {
        UIViewContainer {
            self
        }
    }
}

public struct UIViewContainer: UIViewControllerRepresentable {
    private let viewController: UIViewController
    
    public init(_ viewController: () -> UIViewController) {
        self.viewController = viewController()
    }
    
    public func makeUIViewController(context: Context) -> UIViewController {
        viewController
    }
    
    public func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
