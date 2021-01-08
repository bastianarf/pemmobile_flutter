import 'package:pemmobile_flutter/model/hotelmodel.dart';
import 'package:pemmobile_flutter/model/artikelmodel.dart';
import 'package:pemmobile_flutter/model/detailmodel.dart';

List<HotelModel> getHotels() {
  List<HotelModel> hotel = new List();
  HotelModel hotelModel = new HotelModel();

  //1
  hotelModel.hotelName = "Hotel Indonesia";
  hotelModel.label = "New";
  hotelModel.hotelAddress = "Jakarta";
  hotelModel.rating = 4.5;
  hotelModel.imgUrl =
  "https://1.bp.blogspot.com/-ypds_1YXGWM/Wib3dhr9gTI/AAAAAAAAADs/aW6HhdvJioYSAwpS-PrqGb2DcBF9PbcMgCLcBGAs/s1600/Hotel%2BIndonesia%2BKempinski%2BJakarta%2B%2528Doc.%2Bkempinski%2B.com%2529.jpg";
  hotel.add(hotelModel);
  hotelModel = new HotelModel();

  //1
  hotelModel.hotelName = "Shangri-La";
  hotelModel.label = "Sale";
  hotelModel.hotelAddress = "Surabaya";
  hotelModel.rating = 4.3;
  hotelModel.imgUrl =
  "https://pix10.agoda.net/hotelImages/4867747/0/37b3e62fc43c60b201dc01e621f737c5.jpg?s=1024x768";
  hotel.add(hotelModel);
  hotelModel = new HotelModel();

  //1
  hotelModel.hotelName = "Pullman";
  hotelModel.label = "New";
  hotelModel.hotelAddress = "Jakarta";
  hotelModel.rating = 4.5;
  hotelModel.imgUrl =
  "https://www.ahstatic.com/photos/8276_ho_00_p_1024x768.jpg";
  hotel.add(hotelModel);
  hotelModel = new HotelModel();

  //1
  hotelModel.hotelName = "JW Marriott";
  hotelModel.label = "New";
  hotelModel.hotelAddress = "Malang";
  hotelModel.rating = 4.5;
  hotelModel.imgUrl =
  "https://www.whitelodging.com/wp-content/uploads/2017/01/Austin-JW-Drone02.jpg";
  hotel.add(hotelModel);
  hotelModel = new HotelModel();

  //1
  hotelModel.hotelName = "Ritz Carlton";
  hotelModel.label = "New";
  hotelModel.hotelAddress = "Surabaya";
  hotelModel.rating = 4.5;
  hotelModel.imgUrl =
  "https://aboyinahotelroom.files.wordpress.com/2020/04/0.jpeg";
  hotel.add(hotelModel);
  hotelModel = new HotelModel();

  //1
  hotelModel.hotelName = "Ibis";
  hotelModel.label = "New";
  hotelModel.hotelAddress = "Bandung";
  hotelModel.rating = 4.5;
  hotelModel.imgUrl =
  "https://www.ahstatic.com/photos/1867_ho_00_p_1024x768.jpg";
  hotel.add(hotelModel);
  hotelModel = new HotelModel();

  //1
  hotelModel.hotelName = "Aston";
  hotelModel.label = "New";
  hotelModel.hotelAddress = "Yogyakarta";
  hotelModel.rating = 4.5;
  hotelModel.imgUrl =
  "https://origin.pegipegi.com/jalan/images/pict1L/Y6/Y950706/X950706001.jpg";
  hotel.add(hotelModel);
  hotelModel = new HotelModel();
  return hotel;
}

List<ArtikelModel> getArtikel() {
  List<ArtikelModel> artikel = new List();
  ArtikelModel artikelModel = new ArtikelModel();

//1
    artikelModel.imgUrl =
    "https://image-cdn.medkomtek.com/KM2gXmGzZ3OL_sWP3y9ZbIx7Y7E=/1280x720/smart/filters:quality(75):strip_icc():format(jpeg)/klikdokter-media-buckets/medias/2315945/original/006217400_1593001585-Staycation-di-Hotel-saat-Pandemi_-Amankah-shutterstock_1115638970.jpg";
    artikelModel.title = "Tips Staycation Saat Pandemi";
    artikelModel.desc = "Pandemi membuat kita bosan. Ayo staycation saat pandemi";
    artikel.add(artikelModel);
    artikelModel = new ArtikelModel();

//1
    artikelModel.imgUrl =
    "https://images.solopos.com/2020/12/wisata-virtual.jpg";
    artikelModel.title = "Liburan Virtual di Rumah, Kenapa Tidak?";
    artikelModel.desc = "Selain menghilangkan stres dan menghentikan rutinitas, cara berlibur wisata virtual bisa menghemat banyak biaya";
    artikel.add(artikelModel);
    artikelModel = new ArtikelModel();

//1
    artikelModel.imgUrl =
    "https://asset.kompas.com/crops/CxGqguhB3kwDN2Va2c5Vr8Cp2Xg=/0x1:1000x668/750x500/data/photo/2020/11/03/5fa0e2574833e.jpg";
    artikelModel.title = "5 Tips Liburan Aman Selama Pandemi";
    artikelModel.desc = "Jangan Asal Sentuh Barang";
    artikel.add(artikelModel);
    artikelModel = new ArtikelModel();

//1
    artikelModel.imgUrl =
    "https://wordpress-network.prod.aws.skyscnr.com/wp-content/uploads/2018/05/hotel-heroimage.jpg?w=1000&h=312&crop=1";
    artikelModel.title = "8 Tips Mendapatkan Harga Hotel yang Lebih Murah";
    artikelModel.desc = "Mendapatkan hotel dengan harga murah tidak semudah mendapatkan harga tiket pesawat murah";
    artikel.add(artikelModel);
    artikelModel = new ArtikelModel();

//1
    artikelModel.imgUrl =
    "https://asset.kompas.com/crops/JwzjxPgPyppoI321S0whXAayt2c=/0x42:1000x709/750x500/data/photo/2019/01/10/487199412.jpg";
    artikelModel.title = "10 Cara Mendapatkan Tiket Pesawat Dengan Harga Lebih Murah";
    artikelModel.desc = "Ayo berburu tiket pesawat";
    artikel.add(artikelModel);
    artikelModel = new ArtikelModel();

    return artikel;
}

List<DetailModel> getDetails() {
  List<DetailModel> detail = new List();
  DetailModel detailModel = new DetailModel();

//11
  detailModel.image = "assets/mytrip1.png";
  detailModel.title = "Judul Judulan";
  detailModel.date = "2020/05/20";
  detailModel.desc = "Lorem Ipsum Dolores Apsum Bonjour De La Vintarez";
  detail.add(detailModel);
  detailModel = new DetailModel();

  //11
  detailModel.image = "assets/mytrip2.png";
  detailModel.title = "Judul Judulan 2";
  detailModel.date = "2020/05/20";
  detailModel.desc = "Lorem Ipsum Dolores Apsum Bonjour De La Vintarez";
  detail.add(detailModel);
  detailModel = new DetailModel();

  //11
  detailModel.image = "assets/mytrip3.png";
  detailModel.title = "Judul Judulan 3";
  detailModel.date = "2020/05/20";
  detailModel.desc = "Lorem Ipsum Dolores Apsum Bonjour De La Vintarez";
  detail.add(detailModel);
  detailModel = new DetailModel();

  //11
  detailModel.image = "assets/mytrip4.png";
  detailModel.title = "Judul Judulan 4";
  detailModel.date = "2020/05/20";
  detailModel.desc = "Lorem Ipsum Dolores Apsum Bonjour De La Vintarez";
  detail.add(detailModel);
  detailModel = new DetailModel();

  //11
  detailModel.image = "assets/mytrip5.png";
  detailModel.title = "Judul Judulan 5";
  detailModel.date = "2020/05/20";
  detailModel.desc = "Lorem Ipsum Dolores Apsum Bonjour De La Vintarez";
  detail.add(detailModel);
  detailModel = new DetailModel();

  return detail;
}
