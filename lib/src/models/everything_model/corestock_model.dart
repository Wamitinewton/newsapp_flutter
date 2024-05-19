
class MetaDataModel {
  String? information;
  String? symbol;
  String? lastrefreshed;
  String? interval;
  String? outputsize;
  String? timezone;
  TimeSeries? timeSeries;

  MetaDataModel(
      {this.information,
      this.symbol,
      this.lastrefreshed,
      this.interval,
      this.outputsize,
      this.timezone,
      this.timeSeries});

  MetaDataModel.fromJson(Map<String, dynamic> json) {
    information = json['1. Information'];
    symbol = json['2. Symbol'];
    lastrefreshed = json['3. Last Refreshed'];
    interval = json['4. Interval'];
    outputsize = json['5. Output Size'];
    timezone = json['6. Time Zone'];
    timeSeries = json['Time Series (5min)'] != null
        ? TimeSeries.fromJson(json['Time Series (5min)'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['1. Information'] = information;
    data['2. Symbol'] = symbol;
    data['3. Last Refreshed'] = lastrefreshed;
    data['4. Interval'] = interval;
    data['5. Output Size'] = outputsize;
    data['6. Time Zone'] = timezone;
    if (timeSeries != null) {
      data['Time Series (5min)'] = timeSeries!.toJson();
    }
    return data;
  }
}

class TimeSeries {
  List<IntradayPrices>? intradayPrices;

  TimeSeries({this.intradayPrices});

  TimeSeries.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      intradayPrices = [];
      json.forEach((key, value) {
        intradayPrices!.add(IntradayPrices.fromJson(key, value));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (intradayPrices != null) {
      intradayPrices!.forEach((price) {
        data[price.time!] = price.toJson();
      });
    }
    return data;
  }
}

class IntradayPrices {
  String? time;
  String? open;
  String? high;
  String? low;
  String? close;
  String? volume;

  IntradayPrices(
      {this.time, this.open, this.high, this.low, this.close, this.volume});

  IntradayPrices.fromJson(String key, Map<String, dynamic> json) {
    time = key;
    open = json['1. open'];
    high = json['2. high'];
    low = json['3. low'];
    close = json['4. close'];
    volume = json['5. volume'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['1. open'] = open;
    data['2. high'] = high;
    data['3. low'] = low;
    data['4. close'] = close;
    data['5. volume'] = volume;
    return data;
  }
}