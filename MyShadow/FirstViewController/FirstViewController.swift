import UIKit

final class FirstViewController: UIViewController {

    //MARK: - let/var
    private let sunView = UIView()

    //MARK: - IBOutlets
    @IBOutlet weak var oneTopView: UIView!
    @IBOutlet weak var towTopView: UIView!
    @IBOutlet weak var threeTopView: UIView!
    @IBOutlet weak var oneCenterView: UIView!
    @IBOutlet weak var towCenterView: UIView!
    @IBOutlet weak var bottomView: UIView!

    //MARK: - life cycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        configure ()
        configureGestureRecognizer()
    }

    override func viewDidLayoutSubviews() {
        getArrayViews().forEach ({
            configuration(with: $0)
        })
    }

    //MARK: - flow funcs
    private func configuration(with view: UIView) {
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


    }

    private func configureGestureRecognizer() {
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeDetected))
        swipeRecognizer.direction = .left
        view.addGestureRecognizer(swipeRecognizer)

        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(tapDetected))
        sunView.addGestureRecognizer(panRecognizer)
    }

    @objc private func tapDetected(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        print(translation)
        sunView.center = CGPoint(x: sunView.center.x + translation.x,
                                y: sunView.center.y + translation.y)
        recognizer.setTranslation(CGPointZero, in: self.view)
    }

    private func getArrayViews() -> [UIView]{
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

    @objc private func swipeDetected () {
       guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        navigationController?.pushViewController(controller, animated: true)
    }

    private func moveViewHorizontaly(with distance: CGFloat) {
        UIView.animate(withDuration: 2) {
            self.sunView.frame.origin.x = distance
            self.getArrayViews().forEach({
                self.configuration(with: $0)
            })

        }
    }

    private func moveViewVerticaly(with distance: CGFloat) {
        UIView.animate(withDuration: 2) {
            self.sunView.frame.origin.y = distance
            self.getArrayViews().forEach({
                self.configuration(with: $0)
            })
        }
    }

    //MARK: - IBAction
    @IBAction private func upButtonPressed(_ sender: UIButton) {
        moveViewVerticaly(with: self.view.frame.origin.y + 100)
    }
    @IBAction func downButtonPressed(_ sender: UIButton) {
        moveViewVerticaly(with: self.view.frame.size.height - 200)
    }
    @IBAction func leftButtonPressed(_ sender: UIButton) {
        moveViewHorizontaly(with: self.view.frame.origin.x + 10)
    }
    @IBAction func rightButtonPressed(_ sender: UIButton) {
        moveViewHorizontaly(with: self.view.frame.size.width - 50)
    }
}
