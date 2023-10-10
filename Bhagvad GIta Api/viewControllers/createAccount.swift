import UIKit

class createAccount: UIViewController {
    
    @IBOutlet weak var firstNameTxt: UITextField!
    @IBOutlet weak var lastNameTxt: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = 10
    }
    
    func alert(){
        let alert = UIAlertController.init(title: "Enter a First Name & Last Name", message: "Enter your First Name & Last Name.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        present(alert, animated: true)
    }
    
    func alert2(){
        let alert = UIAlertController.init(title: "Enter a First Name ", message: "Enter your First Name.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        present(alert, animated: true)
    }
    
    func alert3(){
        let alert = UIAlertController.init(title: "Enter a Last Name & Last Name", message: "Enter your Last Name.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        present(alert, animated: true)
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        if firstNameTxt.text == "" && lastNameTxt.text == "" {
            alert()
        }
        else if firstNameTxt.text == "" {
            alert2()
        }
        else if lastNameTxt.text == "" {
            alert3()
        }
        else {
            let navigate = storyboard?.instantiateViewController(withIdentifier: "emailPasswordPage") as! emailPasswordPage
            navigationController?.pushViewController(navigate, animated: true)
        }
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        
        let navigate = storyboard?.instantiateViewController(withIdentifier: "LoginPage") as! LoginPage
        navigationController?.popViewController(animated: true)
        
    }
}
