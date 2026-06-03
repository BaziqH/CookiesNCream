//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//

class CookieTypeTVuCell: UITableViewCell {
//MARK: - OUTLETS
    @IBOutlet weak var cookiesCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        registerNibs()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    //MARK: - Auto height function
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        self.contentView.frame = self.bounds
        self.layoutIfNeeded()
        var size = self.cookiesCollectionView.contentSize
        size.height += 110
        return size
    }
}
//MARK: - COLLECTION VIEW
extension CookieTypeTVuCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        loadCookieOptionsCVuCell(indexPath)
    }
    
    
}
//MARK: - COLLECTION VIEW FLOWLAYOUT
extension CookieTypeTVuCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 190)
    }
}
//MARK: - LOAD CELLS
extension CookieTypeTVuCell{
    func loadCookieOptionsCVuCell(_ indexPath: IndexPath)-> UICollectionViewCell{
        guard let cell = cookiesCollectionView.dequeueReusableCell(withReuseIdentifier: "CookieOptionsCVuCell", for: indexPath) as? CookieOptionsCVuCell else { return CookieOptionsCVuCell() }
        return cell
    }
}
//MARK: - SETUP COLLECTION VIEW
extension CookieTypeTVuCell{
    func setupCollectionView(){
        cookiesCollectionView.delegate = self
        cookiesCollectionView.dataSource = self
    }
    
    func registerNibs(){
        let cookieOptionNib = UINib(nibName: "CookieOptionsCVuCell", bundle: nil)
        cookiesCollectionView.register(cookieOptionNib, forCellWithReuseIdentifier: "CookieOptionsCVuCell")
    }
}
