class Markets {
  String? marketType;
  String? region;
  String? primaryExchange;
  String? localOpen;
  String? currentStatus;
  String? notes;
  Markets({
    this.marketType,
    this.region,
    this.primaryExchange,
    this.localOpen,
    this.currentStatus,
    this.notes,
  });

  Markets.fromJson(Map<String, dynamic> json) {
    marketType = json['market type'];
    region = json['region'];
    primaryExchange = json['primary exchamge'];
    localOpen = json['local open'];
    currentStatus = json['current status'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['market type'] = marketType;
    data['region'] = region;
    data['primary exchange'] = primaryExchange;
    data['local open'] = localOpen;
    data['current status'] = currentStatus;
    data['notes'] = notes;
    return data;
  }
}
