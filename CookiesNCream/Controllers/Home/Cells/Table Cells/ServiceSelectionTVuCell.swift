//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//

class ServiceSelectionTVuCell: UITableViewCell {
//MARK: - OUTLETS
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        registerNibs()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
//MARK: - COLLECTION VIEW
extension ServiceSelectionTVuCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        loadBannerCVuCell(indexPath)
    }
    
    
}
//MARK: - COLLECTION VIEW FLOWLAYOUT
extension ServiceSelectionTVuCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 254)
    }
}
//MARK: - LOAD CELLS
extension ServiceSelectionTVuCell{
    func loadBannerCVuCell(_ indexPath: IndexPath)-> UICollectionViewCell{
        guard let cell = bannerCollectionView.dequeueReusableCell(withReuseIdentifier: "BannerCVuCell", for: indexPath) as? BannerCVuCell else { return BannerCVuCell() }
        return cell
    }
}
//MARK: - SETUP COLLECTION VIEW
extension ServiceSelectionTVuCell{
    func setupCollectionView(){
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
    }
    
    func registerNibs(){
        let bannerNib = UINib(nibName: "BannerCVuCell", bundle: nil)
        bannerCollectionView.register(bannerNib, forCellWithReuseIdentifier: "BannerCVuCell")
    }
}
