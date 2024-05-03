
class DemoModel {
  List<String>? gameValue;
  bool? isXturn;

  DemoModel({this.gameValue, this.isXturn});

  DemoModel.fromJson(Map<String, dynamic> json) {
    if(json["gameValue"] is List) {
      gameValue = json["gameValue"] == null ? null : List<String>.from(json["gameValue"]);
    }
    if(json["isXturn"] is bool) {
      isXturn = json["isXturn"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(gameValue != null) {
      _data["gameValue"] = gameValue;
    }
    _data["isXturn"] = isXturn;
    return _data;
  }
}