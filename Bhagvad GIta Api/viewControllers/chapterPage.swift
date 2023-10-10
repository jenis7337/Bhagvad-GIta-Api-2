import UIKit

class chapterPage: UIViewController {
    
    @IBOutlet weak var idLb: UILabel!
    @IBOutlet weak var summaryLb: UILabel!
    @IBOutlet weak var nameLb: UILabel!

    
    var a = Int()
    var b = String()
    var c = String()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        idLb.text = "\(a)"
        summaryLb.text = b
        nameLb.text = c
      
        
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "geeta") as! geeta
        navigationController?.popViewController(animated: true)
    }
    
}

