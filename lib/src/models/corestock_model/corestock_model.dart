class MetaData {
  String? information;
  String? symbol;
  String? lastrefreshed;
  String? interval;
  String? outputsize;
  String? timezone;
  TimeSeries? timeSeries;

  MetaData(
      {this.information,
      this.symbol,
      this.lastrefreshed,
      this.interval,
      this.outputsize,
      this.timezone,
      this.timeSeries});

  MetaData.fromJson(Map<String, dynamic> json) {
    information = json['information'];
    symbol = json['symbol'];
    lastrefreshed = json['lastrefreshed'];
    interval = json['interval'];
    outputsize = json['outputsize'];
    timezone = json['timezone'];
    timeSeries = json['timeseries'] != null
        ? TimeSeries.fromJson(json['timeseries'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['information'] = information;
    data['symbol'] = symbol;
    data['lastrefreshed'] = lastrefreshed;
    data['interval'] = interval;
    data['outputsize'] = outputsize;
    data['timezone'] = timezone;
    if (timeSeries != null) {
      data['timeseries'] = timeSeries!.toJson();
    }
    return data;
  }
}

class TimeSeries {
  List<IntradayPrices>? intradayPries;

  TimeSeries({this.intradayPries});

  TimeSeries.fromJson(Map<String, dynamic> json) {
    if (json['intradayPrices'] != null) {
      intradayPries = <IntradayPrices>[];
      json['intradayPrices'].forEach((v) {
        intradayPries!.add(IntradayPrices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (intradayPries != null) {
      data['intradayprices'] = intradayPries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class IntradayPrices {
  String? open;
  String? high;
  String? low;
  String? close;
  String? adjustedClose;
  String? volume;
  String? dividendamount;
  String? splitCoefficient;

  IntradayPrices(
      {this.open,
      this.high,
      this.low,
      this.close,
      this.volume,
      this.adjustedClose,
      this.dividendamount,
      this.splitCoefficient});

  IntradayPrices.fromJson(Map<String, dynamic> json) {
    open = json['open'];
    high = json['high'];
    low = json['low'];
    close = json['close'];
    adjustedClose = json['adjustedclose'];
    dividendamount = json['dividend amount'];
    splitCoefficient = json['split coefficient'];
    volume = json['volume'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['open'] = open;
    data['high'] = high;
    data['low'] = low;
    data['close'] = close;
    data['volume'] = volume;
    data['adjustedclose'] = adjustedClose;
    data['dividend amount'] = dividendamount;
    data['split coefficient'] = splitCoefficient;
    return data;
  }
}
