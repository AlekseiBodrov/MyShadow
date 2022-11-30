import UIKit

class FirstViewController: UIViewController {

    let sunView = UIView()

    @IBOutlet weak var oneTopView: UIView!
    @IBOutlet weak var towTopView: UIView!
    @IBOutlet weak var threeTopView: UIView!
    @IBOutlet weak var oneCenterView: UIView!
    @IBOutlet weak var towCenterView: UIView!
    @IBOutlet weak var bottomView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configure ()
    }

    override func viewDidLayoutSubviews() {
        getArrayViews().forEach ({
            configuration(with: $0)
        })
    }

    func configuration(with view: UIView) {
        let size = FirstModel.getOffsetForShadow(positionSun: sunView, positionView: view)
        view.dropShadow(offset: size)
    }

    private func configure (){
        sunView.frame = .init(x: 20, y: 50, width: 40, height: 40)
        sunView.backgroundColor = .yellow
        sunView.rounded(radius: sunView.frame.width / 2)
        view.addSubview(sunView)

        getArrayViews().forEach({
            $0.rounded(radius: 5)
        })

        let recognizer = UISwipeGestureRecognizer(target: self, action: #selector(gestureDetected))
        recognizer.direction = .left
        view.addGestureRecognizer(recognizer)
    }

    func getArrayViews() -> [UIView]{
        let arrayViews = [
            self.oneTopView,
            self.towTopView,
            self.threeTopView,
            self.oneCenterView,
            self.towCenterView,
            self.bottomView
        ]
        guard let array = arrayViews as? [UIView] else { return [UIView()]}
        return array
    }

    @objc private func gestureDetected () {
       guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        navigationController?.pushViewController(controller, animated: true)
    }

    @IBAction func upButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 2) {
            self.sunView.frame.origin.y = self.view.frame.origin.y + 100
            self.getArrayViews().forEach({
                self.configuration(with: $0)
            })
        }
    }

    @IBAction func downButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 2) {
            self.sunView.frame.origin.y = self.view.frame.size.height - 200
            self.getArrayViews().forEach({
                self.configuration(with: $0)
            })
        }
    }

    @IBAction func leftButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 2) {
            self.sunView.frame.origin.x = self.view.frame.origin.x + 10
            self.getArrayViews().forEach({
                self.configuration(with: $0)
            })

        }
    }
    @IBAction func rightButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 2) {
            self.sunView.frame.origin.x = self.view.frame.size.width - 50
            self.getArrayViews().forEach({
                self.configuration(with: $0)
            })
        }
    }
}
