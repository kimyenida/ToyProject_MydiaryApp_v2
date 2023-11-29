//
//  NextViewController.swift
//  MyfirstAppMVC
//
//  Created by Admin iMBC on 11/27/23.
//

import UIKit

class MovieViewController: UIViewController {
    
    // 로딩화면에 쓰일 뷰
    var sv : UIView!
    
    //콜렉션 뷰
    private var movieCollectionView: MovieView = MovieView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())

    // 영화정보들을 담은 리스트
    lazy var list : [MovieData] = {
        var datalist = [MovieData]()
        return datalist
    }()
    
    // columns는 콜렉션 뷰 컬럼 수, space는 간격
    let columns : CGFloat = 2
    let space : CGFloat = 1
    

    override func viewDidLoad() {
        //API 연동 함수 실행
        self.getAPI()
        
        super.viewDidLoad()
        
        // 로딩화면 실행(UIViewController를 extension함
        sv = UIViewController.displaySpinner(onView: self.view)
        configureCollectionView() //콜렉션 뷰 오토레이아웃
        registerCollectionView() //콜렉션 뷰셀 등록
        collectionViewDelegate() //콜렉션 뷰 델리게이트 등록
    }
    
 
    
    
    func configureCollectionView(){
//        movieCollectionView = MovieView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        movieCollectionView.translatesAutoresizingMaskIntoConstraints = false
        movieCollectionView.backgroundColor = .white
        self.view.addSubview(movieCollectionView)
        movieCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        movieCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        movieCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        movieCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        
    }
    
    func registerCollectionView(){
        movieCollectionView.register(MovieCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "cellIdentifier")
        
    }
    
    func collectionViewDelegate(){
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
    }
    
    func getAPI(){
        let headers = [
            
        //json형식으로 받는다
          "accept": "application/json",
          //인증키
          "Authorization": Bundle.main.db_apikey
        ]

        // 변경가능한 URL생성(엔드포인트)
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/search/movie?query=어벤져스&include_adult=false&language=ko-KR&page=1")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET" //메소드방식
        request.allHTTPHeaderFields = headers //위에 정의한 헤더를 할당

        //session 설정
        let session = URLSession.shared
        
        //요청이 완료되면 핸들러가 실행된다.
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let error = error{
                print("Error : \(error)")
            } else if let data = data{
                do{
                    
                    //json을 파싱하기위해 JSONSerialization사용
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]{
                        if let results = json["results"] as? [[String:Any]]{
                            for result in results {
                                if let title = result["title"] as? String, let overview = result["overview"] as? String, let poster_path = result["poster_path"] as? String{
                                    
                                    let mvo = MovieData()
                                    mvo.title = title
                                    mvo.content = overview
                                    let url = "https://image.tmdb.org/t/p/w220_and_h330_face"+poster_path
                                    if let urls = URL(string: url){
                                        if let imageData = try? Data(contentsOf: urls){
                                            mvo.imagePath = url
                                            mvo.imageiamge = UIImage(data: imageData)
                                            
                                            self.list.append(mvo)
                                        }
                                    }
                                  
                                }
                            }
                            
                            // for문 다 돌고 UI를 업데이트(UI다시로드)
                            DispatchQueue.main.async {
                                self.movieCollectionView.reloadData()
                            }
                        }
                    }
                } catch{
                    print("error decoding Json:\(error)")
                }
            }
        })

        // task 실행
        dataTask.resume()
    }
    
    func getImage(_ index:Int)->UIImage{
        
        //리스트 해당인덱스를 mvo변수에 저장(MovieData타입)
        let mvo = self.list[index]
        
        //mvo의 imageimage(UIImage)에 이미지가 있다면 그대로 반환
        if let saveImaged = mvo.imageiamge{
            return saveImaged
        }
        else{
            // imagePath(string타입)을 URL로 변환
            if let imagePath = mvo.imagePath {
                let url:URL! = URL(string:mvo.imagePath!)
                do{
                    let imageData = try Data(contentsOf: url)
                    mvo.imageiamge = UIImage(data:imageData)
                    return mvo.imageiamge!
                }catch{
                    print("error...")
                }
               
            }
        }
        let images = UIImage(systemName: "x.circle.fill")
        return images!
    }

}

extension MovieViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = movieCollectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifier", for: indexPath) as! MovieCollectionViewCell
        let row = self.list[indexPath.row]
        cell.membernameLabel?.text = row.title
        
        //비동기 실행
        DispatchQueue.main.async(execute: {
            print("비동기 방식으로 실행되는 부분입니다.")
            cell.movieImageview.image = self.getImage(indexPath.row)
        })
        
        //로딩창 제거
        UIViewController.removeSpinner(spinner: sv)

        return cell

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = (collectionView.frame.width / columns) - (space * (columns - 1))
        return CGSize(width: width, height: width*1.5)
    }
    //위아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return space
    }

    //좌우 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return space
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailviewController = MovieDetailViewController()
        detailviewController.content = list[indexPath.row].content ?? "content 없음"
        detailviewController.modalPresentationStyle = .pageSheet
        present(detailviewController, animated: true)
        
    }
    
    
}

extension Bundle{
    var gpt_apikey: String{
        guard let filepath = Bundle.main.path(forResource: "APIKeys", ofType: "plist"),
              let plistDict = NSDictionary(contentsOfFile: filepath) else{
            fatalError("couldn't fine file key")
        }
        guard let value = plistDict.object(forKey: "OpenAI_Key") as? String else{
            fatalError("Couldn't find key")
        }
        
        return value
    }
    
    var db_apikey: String{
        guard let filepath = Bundle.main.path(forResource: "APIKeys", ofType: "plist"),
              let plistDict = NSDictionary(contentsOfFile: filepath) else{
            fatalError("couldn't fine file key")
        }
        guard let value = plistDict.object(forKey: "TMDB_Key") as? String else{
            fatalError("Couldn't find key")
        }
        
        return value
    }
}
