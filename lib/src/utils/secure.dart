enum YedPayApi { STAGE, PRODUCTION }

extension YedPayApiExt on YedPayApi {
  String get apiKey {
    switch (this) {
      case YedPayApi.STAGE:
        return "CvyDa1xP/uKpcxEDxQ1GUIq5k4dhFaRA9xKMxy7GbVQ=";
      case YedPayApi.PRODUCTION:
        return "CvyDa1xP/uKpcxEDxQ1GUIq5k4dhFaRA9xKMxy7GbVQ=";
    }
  }

  String get signKey {
    switch (this) {
      case YedPayApi.STAGE:
        return "BrCFIujkLg0Px8ILe5PKjYgpdvD0YdZz";
      case YedPayApi.PRODUCTION:
        return "BrCFIujkLg0Px8ILe5PKjYgpdvD0YdZz";
    }
  }

  String get url {
    switch (this) {
      case YedPayApi.STAGE:
        return "https://api-staging.yedpay.com/v1/online-payment";
      case YedPayApi.PRODUCTION:
        return "https://api.yedpay.com/v1/online-payment";
    }
  }
}
