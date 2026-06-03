/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/

extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return loadServiceSelectionTVuCell(indexPath)
        } else if indexPath.section == 1 {
            return loadCookieTypeTVuCell(indexPath)
        }
        return UITableViewCell()
    }
}
//MARK: - LOAD CELLS
extension HomeVC{
    func loadServiceSelectionTVuCell(_ indexPath: IndexPath)->UITableViewCell{
        guard let cell = homeTableView.dequeueReusableCell(withIdentifier: "ServiceSelectionTVuCell", for: indexPath) as? ServiceSelectionTVuCell else {
            return ServiceSelectionTVuCell()
        }
        return cell
    }
    func loadCookieTypeTVuCell(_ indexPath: IndexPath)->UITableViewCell{
        guard let cell = homeTableView.dequeueReusableCell(withIdentifier: "CookieTypeTVuCell", for: indexPath) as? CookieTypeTVuCell else {
            return CookieTypeTVuCell()
        }
        return cell
    }
}
//MARK: - SETUP TABLE VIEW
extension HomeVC{
    
    func setupTableView(){
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        homeTableView.rowHeight = UITableView.automaticDimension
        homeTableView.estimatedRowHeight = 150
    }
    //MARK: - REGISTER NIBS
    func registerNibs(){
        let serviceNib = UINib(nibName: "ServiceSelectionTVuCell", bundle: nil)
        homeTableView.register(serviceNib, forCellReuseIdentifier: "ServiceSelectionTVuCell")

        let cookieTypeNib = UINib(nibName: "CookieTypeTVuCell", bundle: nil)
        homeTableView.register(cookieTypeNib, forCellReuseIdentifier: "CookieTypeTVuCell")
    }
}
