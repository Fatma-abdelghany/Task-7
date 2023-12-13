class AdData{
  String? id;
  String? title;
  String? image;

  AdData();
  AdData.fromJson(Map<String,dynamic> jsonData){
    id=jsonData["id"];
    title=jsonData["title"];
    image=jsonData["image"];

  }

  Map<String,dynamic> toJson(){
     Map<String,dynamic> adsData={};
     adsData["id"]=id;
     adsData["title"]=title;
     adsData["image"]=image;
     return adsData;

  }
}