import UIKit
class ViewController : UIViewController {
    
    var moleButton = UIButton()
    var scoreLabel = UILabel()
    var backgroundLabel = UILabel()
    var gameOverLabel = UILabel()
    var timer = Timer()
    var screenWidth = 0
    var screenHeight = 0
    var score = 0
    var moles = 0
    let interval = 5.0
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
        moleButton.frame = CGRect(x: Int.random(in: margin...screenWidth-margin-40), y: Int.random(in: margin + (screenHeight/10)...screenHeight - margin - 40), width:40, height:40)
        moleButton.layer.cornerRadius = 20
        moleButton.backgroundColor = UIColor.brown
        moleButton.addTarget(self, action: #selector(hitMe(_:)), for: .touchUpInside)
        
        //Timer
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(missedMole), userInfo: nil, repeats: true)
        
        view.addSubview(scoreLabel)
        view.addSubview(backgroundLabel)
        view.addSubview(moleButton)
        self.view = view
    }
    @objc func hitMe(_ sender:UIButton!) {
        score += 1
        moles += 1
        scoreLabel.text = "\(score)"
        moleButton.removeFromSuperview()
        moleButton.frame = CGRect(x: Int.random(in: margin...screenWidth-margin-40), y: Int.random(in: margin + (screenHeight/10)...screenHeight - margin - 40), width:40, height:40)
        view.addSubview(moleButton)
        timer.invalidate()
        if (moles >= 10) {
            gameOver()
        }
        else {
            timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(missedMole), userInfo: nil, repeats: true)
        }
    }
    @objc func missedMole() {
        moleButton.removeFromSuperview()
        moles += 1
        moleButton.frame = CGRect(x: Int.random(in: margin...screenWidth-margin-40), y: Int.random(in: margin + (screenHeight/10)...screenHeight - margin - 40), width:40, height:40)
        view.addSubview(moleButton)
        if (moles >= 10) {
            timer.invalidate()
            gameOver()
        }
    }
    @objc func gameOver() {
        moleButton.removeFromSuperview()
        backgroundLabel.removeFromSuperview()
        
        //Display game over text
        gameOverLabel.frame = CGRect(x: margin, y: margin * 2, width: screenWidth - margin * 2, height: 30)
        gameOverLabel.backgroundColor = UIColor.white
        gameOverLabel.text = "Game Over"
        gameOverLabel.textAlignment = NSTextAlignment.center
        
        scoreLabel.frame = CGRect(x: margin, y: margin * 4, width: screenWidth - margin * 2, height: 30)
        scoreLabel.text = "Your scored \(score) points!"
        scoreLabel.textAlignment = NSTextAlignment.center
        
        view.addSubview(gameOverLabel)
        view.addSubview(scoreLabel)
    }
}
