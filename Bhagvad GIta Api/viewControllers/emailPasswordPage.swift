import UIKit
import FirebaseAuth
import FirebaseCore
import FirebaseDatabase
import FirebaseFirestore

class emailPasswordPage: UIViewController {
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var showHideButton: UIButton!
    
    var refa: Firestore!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refa = Firestore.firestore()
        showHideButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        createAccountButton.layer.cornerRadius = 10
    }
    
    @objc func togglePasswordVisibility() {
        passwordTxt.isSecureTextEntry.toggle()
        
        if passwordTxt.isSecureTextEntry {
            showHideButton.setImage(UIImage(named: "hide"), for: .normal)
        } else {
            showHideButton.setImage(UIImage(named: "view (2)"), for: .normal)
        }
    }
    
    func fireStore(){
        Auth.auth().createUser(withEmail: emailTxt.text!, password: passwordTxt.text!){ [self]authDataResult, error in
            print(authDataResult,error?.localizedDescription)
            
            self.refa.collection("User").document((authDataResult?.user.uid)!).setData(["Email ID": emailTxt.text!,"Password": passwordTxt.text!])
        }
    }
    
    func alert(){
        let alert = UIAlertController.init(title: "Enter a email address", message: "You'll need to enter a email to continue.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        present(alert, animated: true)
    }
    
    func alert2(){
        let alert = UIAlertController.init(title: "Enter a password", message: "You'll need to enter a 6 digit number to continue.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        present(alert, animated: true)
    }
    @IBAction func createAccountAction(_ sender: UIButton) {
        if emailTxt.text == ""{
            alert()
        }
        else if passwordTxt.text!.count <= 5{
            alert2()
        }
        else{
            let navigation = storyboard?.instantiateViewController(withIdentifier: "geeta") as! geeta
            navigationController?.pushViewController(navigation, animated: true)
            fireStore()
        }
    }
    @IBAction func backButtonAction(_ sender: Any) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "") as! createAccount
        navigationController?.popViewController(animated: true)
    }
}
