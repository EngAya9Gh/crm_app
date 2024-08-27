import '../../utils/end_points.dart';

enum PeriodicCommunicationTypeEnum { waiting, evaluated }

extension InstallQualityTypeExtension on PeriodicCommunicationTypeEnum {
  String get value {
    switch (this) {
      case PeriodicCommunicationTypeEnum.waiting:
        return 'بالإنتظار';
      case PeriodicCommunicationTypeEnum.evaluated:
        return 'تم التقييم';
    }
  }

  String get url {
    switch (this) {
      case PeriodicCommunicationTypeEnum.waiting:
        return EndPoints.care.getPeriodicCommunication;
      case PeriodicCommunicationTypeEnum.evaluated:
        return EndPoints.care.getCareRate;
    }
  }

  String toParam() {
    switch (this) {
      case PeriodicCommunicationTypeEnum.waiting:
        return 'wait';
      case PeriodicCommunicationTypeEnum.evaluated:
        return 'done';
    }
  }

  bool get isWaiting => this == PeriodicCommunicationTypeEnum.waiting;

  bool get isEvaluated => this == PeriodicCommunicationTypeEnum.evaluated;
}
