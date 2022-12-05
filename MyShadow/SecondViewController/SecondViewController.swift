import UIKit

final class SecondViewController: UIViewController {

    //MARK: - let/var
    var timer = Timer()
    var isMoveUp = false
    let sunView = UIView()

    //MARK: - IBOutlets
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!
    @IBOutlet weak var view7: UIView!
    @IBOutlet weak var view8: UIView!
    @IBOutlet weak var view9: UIView!
    @IBOutlet weak var view10: UIView!

    //MARK: - life cycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    override func viewDidLayoutSubviews() {
        getArrayViews().forEach ({
            configuration(with: $0)
        })
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        move()
    }

    //MARK: - flow funcs
    func move(){

        timer = Timer.scheduledTimer(withTimeInterval: 20, repeats: true, block: { _ in
            let distanceY = self.isMoveUp == false ? self.view.frame.height - 50 : 50
            UIView.animate(withDuration: 20) {
                self.sunView.frame.origin.y = distanceY
                self.getArrayViews().forEach({
                    self.configuration(with: $0)
                })
                self.isMoveUp = !self.isMoveUp
            }
        })
        timer.fire()
    }

    func configure() {
        sunView.frame = .init(x: -50, y: 50, width: 100, height: 100)
        sunView.backgroundColor = .yellow
        sunView.rounded(radius: sunView.frame.width / 2)
        view.addSubview(sunView)

        getArrayViews().forEach({
            $0.rounded(radius: 5)
        })
    }

    func getArrayViews() -> [UIView]{
        let arrayViews = [
            self.view1,
            self.view2,
            self.view3,
            self.view4,
            self.view5,
            self.view6,
            self.view7,
            self.view8,
            self.view9,
            self.view10
        ]
        guard let array = arrayViews as? [UIView] else { return [UIView()]}
        return array
    }

    func configuration(with view: UIView) {
        let size = SecondModel.getOffsetForShadow(positionSun: sunView, positionView: view)
        view.dropShadow(offset: size)
    }
}

