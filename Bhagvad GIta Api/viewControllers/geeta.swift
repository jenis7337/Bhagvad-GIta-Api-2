
import UIKit

struct API : Codable {
    var id : Int
    var name : String
    var slug : String
    var name_transliterated : String
    var name_translated : String
    var verses_count : Int
    var chapter_number : Int
    var name_meaning : String
    var chapter_summary : String
    var chapter_summary_hindi : String
    
}


class geeta: UIViewController {
    
    var arr : [API] = []
    
    @IBOutlet weak var dataTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    func getData(){
        let url = URL(string: "https://bhagavad-gita3.p.rapidapi.com/v2/chapters/")
        var ur = URLRequest(url: url!)
        ur.httpMethod = "GET"
        ur.allHTTPHeaderFields = ["X-RapidAPI-Key" : "38bcb0940amsh54c05eeecacd005p1b3dd1jsn613bd738107f"]
        
        URLSession.shared.dataTask(with: ur) {[self] data , response , error in
            do {
                if error == nil {
                    arr = try JSONDecoder().decode([API].self, from: data!)
                    print(arr)
                    DispatchQueue.main.async {
                        self.dataTable.reloadData()
                    }
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}


extension geeta : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dataTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! dataTableViewCell
        cell.idLb.text = "\(arr[indexPath.row].id)"
        cell.nameLb.text = arr[indexPath.row].name_translated
        cell.versesLb.text = "\(arr[indexPath.row].verses_count)"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    func navigation(idNumber : Int,Sy : String,sName : String) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "chapterPage") as! chapterPage
        navigate.a = idNumber
        navigate.b = Sy
        navigate.c = sName
      
        navigationController?.pushViewController(navigate, animated: true)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigation(idNumber: arr[indexPath.row].id, Sy: arr[indexPath.row].chapter_summary, sName: arr[indexPath.row].name_translated)
    }
    
}

