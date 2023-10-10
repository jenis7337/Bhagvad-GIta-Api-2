import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore
import FirebaseCore

class LoginPage: UIViewController {
    
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var logInButtona: UIButton!
    
    var refa: Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refa = Firestore.firestore()
        createAccountButton.layer.cornerRadius = 10
        createAccountButton.layer.borderWidth = 1
        createAccountButton.layer.borderColor = UIColor.white.cgColor
        logInButtona.layer.cornerRadius = 10
    }
    func alert(title:String,message:String){
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        present(alert, animated: true)
    }
    
    func logIn(){
        Auth.auth().signIn(withEmail: userNameTxt.text!, password: passwordTxt.text!){authDataResult, error in
            if error == nil{
                let navigate = self.storyboard?.instantiateViewController(identifier: "geeta") as! geeta
                self.navigationController?.pushViewController(navigate, animated: true)
            }
            else{
                self.alert(title: "Error", message: error!.localizedDescription)
            }
        }
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        
        if userNameTxt.text == "" && passwordTxt.text == ""{
            alert(title: "Error", message: "Plese Enter Your Username & Password.")
        }
        
        else if userNameTxt.text == ""{
            alert(title:"Error",message: "Plese Enter Your Username.")
        }
        
        else if passwordTxt.text == ""{
            alert( title:"Erorr",message: "Plese Enter Your Password.")
        }
        logIn()
    }
    
    @IBAction func cretaeAccountAction(_ sender: Any) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "createAccount") as! createAccount
        navigationController?.pushViewController(navigate, animated: true)
    }
}
