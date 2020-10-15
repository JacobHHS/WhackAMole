import UIKit
class ViewController : UIViewController {
    
    var moleButton = UIButton()
    var scoreLabel = UILabel()
    var backgroundLabel = UILabel()
    var screenWidth = 0
    var screenHeight = 0
    var score = 0
    let margin = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let screenBounds : CGRect = UIScreen.main.bounds
        screenWidth = Int(screenBounds.width)
        screenHeight = Int(screenBounds.height)
        
        //Score Label
        scoreLabel.frame = CGRect(x: margin, y: margin, width: 50, height: screenHeight/10)
        scoreLabel.backgroundColor = UIColor.white
        scoreLabel.text = "\(score)"
        
        //Background Label
        backgroundLabel.frame = CGRect(x: margin, y: margin + screenHeight/10, width: screenWidth - margin * 2, height: screenHeight - margin * 2 - screenHeight / 10)
        backgroundLabel.backgroundColor = UIColor.green
        
        //Button
        moleButton.frame = CGRect(x: Int.random(in: margin...screenWidth-margin-40), y: Int.random(in: margin + (screenHeight/10)...screenHeight - margin), width:40, height:40)
        moleButton.layer.cornerRadius = 20
        moleButton.backgroundColor = UIColor.brown
        moleButton.addTarget(self, action: #selector(hitMe(_:)), for: .touchUpInside)
        
        view.addSubview(scoreLabel)
        view.addSubview(backgroundLabel)
        view.addSubview(moleButton)
        self.view = view
    }
    @objc func hitMe(_ sender:UIButton!) {
        print("Mole has been hit")
        score += 1
        scoreLabel.text = "\(score)"
        moleButton.removeFromSuperview()
    }
}
