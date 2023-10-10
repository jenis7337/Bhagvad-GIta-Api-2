import UIKit

class dataTableViewCell: UITableViewCell {

    @IBOutlet weak var idLb: UILabel!
    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var versesLb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
