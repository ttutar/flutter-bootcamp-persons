import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';

class KisilerDaoRepository{
  var collectionKisiler = FirebaseFirestore.instance.collection("Kisiler");

  Future<void> kaydet(String kisi_ad, String kisi_tel) async {
    var yeniKisi = HashMap<String, dynamic>();
    yeniKisi["kisi_id"] = "";
    yeniKisi["kisi_ad"] = kisi_ad;
    yeniKisi["kisi_tel"] = kisi_tel;
    collectionKisiler.add(yeniKisi);
  }

  Future<void> guncelle(String kisi_id, String kisi_ad, String kisi_tel) async{
    var guncellenenKisi = HashMap<String, dynamic>();
    guncellenenKisi["kisi_ad"] = kisi_ad;
    guncellenenKisi["kisi_tel"] = kisi_tel;
    collectionKisiler.doc(kisi_id).update(guncellenenKisi);
  }

  Future<void> sil(String kisi_id) async {
    collectionKisiler.doc(kisi_id).delete();
  }

  Future<List<Kisiler>> kisileriYukle() async {
    var kisilerListesi = <Kisiler>[];
    var k1 = Kisiler(kisi_id: "1", kisi_ad: "Tugay", kisi_tel: "1111");
    var k2 = Kisiler(kisi_id: "2", kisi_ad: "Tuncay", kisi_tel: "2222");
    var k3 = Kisiler(kisi_id: "3", kisi_ad: "Pelin", kisi_tel: "333");
    kisilerListesi.add(k1);
    kisilerListesi.add(k2);
    kisilerListesi.add(k3);
    return kisilerListesi;
  }

  Future<List<Kisiler>> ara(String aramaKelimesi) async {
    var kisilerListesi = <Kisiler>[];
    var k1 = Kisiler(kisi_id: "1", kisi_ad: "Tugay", kisi_tel: "1111");
    kisilerListesi.add(k1);
    return kisilerListesi;
  }

}