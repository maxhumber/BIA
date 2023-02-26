import SwiftUI

class ViewControllerThinkingViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set blue background color
        view.backgroundColor = .blue
        
        // Create white box
        let whiteBox = UIView()
        whiteBox.backgroundColor = .white
        whiteBox.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(whiteBox)
        
        // Center the white box horizontally and vertically
        whiteBox.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        whiteBox.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        whiteBox.widthAnchor.constraint(equalToConstant: 100).isActive = true
        whiteBox.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        // Create the text label
        let textLabel = UILabel()
        textLabel.text = "UIKit"
        textLabel.textAlignment = .center
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        whiteBox.addSubview(textLabel)
        
        // Center the text label horizontally and vertically
        textLabel.centerXAnchor.constraint(equalTo: whiteBox.centerXAnchor).isActive = true
        textLabel.centerYAnchor.constraint(equalTo: whiteBox.centerYAnchor).isActive = true
        textLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        textLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}

struct ViewControllerThinking_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerThinkingViewController()
            .preview()
    }
}
