import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configure ()
    }

    override func viewDidLayoutSubviews() {
    }

    private func configure (){
        let recognizer = UISwipeGestureRecognizer(target: self, action: #selector(gestureDetected))
        recognizer.direction = .right
        view.addGestureRecognizer(recognizer)
    }

    @objc private func gestureDetected () {
        navigationController?.popViewController(animated: true)
    }
}
