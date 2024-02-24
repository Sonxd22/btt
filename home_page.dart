class Province {
  int id;
  String name;
  String level;

  Province({required this.id, required this.name, required this.level});

  factory Province.fromMap(Map<String, dynamic> map) {
    return Province(
      id: map['id'],
      name: map['name'],
      level: map['level'],
    );
  }
}

class District {
  int id;
  String name;
  String level;
  int provinceId;

  District({
    required this.id,
    required this.name,
    required this.level,
    required this.provinceId,
  });

  factory District.fromMap(Map<String, dynamic> map) {
    return District(
      id: map['id'],
      name: map['name'],
      level: map['level'],
      provinceId: map['provinceId'],
    );
  }
}

class Ward {
  int id;
  String name;
  String level;
  int districtId;
  int provinceId;

  Ward({
    required this.id,
    required this.name,
    required this.level,
    required this.districtId,
    required this.provinceId,
  });

  factory Ward.fromMap(Map<String, dynamic> map) {
    return Ward(
      id: map['id'],
      name: map['name'],
      level: map['level'],
      districtId: map['districtId'],
      provinceId: map['provinceId'],
    );
  }
}

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Test Province', () {
    Map<String, dynamic> data = {
      'id': 1,
      'name': 'Province A',
      'level': 'A',
    };

    Province province = Province.fromMap(data);

    expect(province.id, 1);
    expect(province.name, 'Province A');
    expect(province.level, 'A');
  });

  test('Test District', () {
    Map<String, dynamic> data = {
      'id': 1,
      'name': 'District A',
      'level': 'A',
      'provinceId': 1,
    };

    District district = District.fromMap(data);

    expect(district.id, 1);
    expect(district.name, 'District A');
    expect(district.level, 'A');
    expect(district.provinceId, 1);
  });

  test('Test Ward', () {
    Map<String, dynamic> data = {
      'id': 1,
      'name': 'Ward A',
      'level': 'A',
      'districtId': 1,
      'provinceId': 1,
    };

    Ward ward = Ward.fromMap(data);

    expect(ward.id, 1);
    expect(ward.name, 'Ward A');
    expect(ward.level, 'A');
    expect(ward.districtId, 1);
    expect(ward.provinceId, 1);
  });
}
class AddressInfo {
  Province? province;
  District? district;
  Ward? ward;
  String? street;

  AddressInfo({this.province, this.district, this.ward, this.street});

  factory AddressInfo.fromMap(Map<String, dynamic> map) {
    return AddressInfo(
      province: map['province'] != null ? Province.fromMap(map['province']) : null,
      district: map['district'] != null ? District.fromMap(map['district']) : null,
      ward: map['ward'] != null ? Ward.fromMap(map['ward']) : null,
      street: map['street'],
    );
  }
}

class UserInfo {
  String? name;
  String? email;
  String? phoneNumber;
  DateTime? birthDate;
  AddressInfo? address;

  UserInfo({this.name, this.email, this.phoneNumber, this.birthDate, this.address});

  factory UserInfo.fromMap(Map<String, dynamic> map) {
    return UserInfo(
      name: map['name'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      birthDate: map['birthDate'] != null ? DateTime.parse(map['birthDate']) : null,
      address: map['address'] != null ? AddressInfo.fromMap(map['address']) : null,
    );
  }
}

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Test AddressInfo', () {
    Map<String, dynamic> data = {
      'province': {
        'id': 1,
        'name': 'Province A',
        'level': 'A',
      },
      'district': {
        'id': 1,
        'name': 'District A',
        'level': 'A',
        'provinceId': 1,
      },
      'ward': {
        'id': 1,
        'name': 'Ward A',
        'level': 'A',
        'districtId': 1,
        'provinceId': 1,
      },
      'street': 'Street A',
    };

    AddressInfo addressInfo = AddressInfo.fromMap(data);

    expect(addressInfo.province?.id, 1);
    expect(addressInfo.province?.name, 'Province A');
    expect(addressInfo.province?.level, 'A');

    expect(addressInfo.district?.id, 1);
    expect(addressInfo.district?.name, 'District A');
    expect(addressInfo.district?.level, 'A');
    expect(addressInfo.district?.provinceId, 1);

    expect(addressInfo.ward?.id, 1);
    expect(addressInfo.ward?.name, 'Ward A');
    expect(addressInfo.ward?.level, 'A');
    expect(addressInfo.ward?.districtId, 1);
    expect(addressInfo.ward?.provinceId, 1);

    expect(addressInfo.street, 'Street A');
  });

  test('Test UserInfo', () {
    Map<String, dynamic> data = {
      'name': 'John Doe',
      'email': 'johndoe@example.com',
      'phoneNumber': '123456789',
      'birthDate': '1990-01-01',
      'address': {
        'province': {
          'id': 1,
          'name': 'Province A',
          'level': 'A',
        },
        'district': {
          'id': 1,
          'name': 'District A',
          'level': 'A',
          'provinceId': 1,
        },
        'ward': {
          'id': 1,
          'name': 'Ward A',
          'level': 'A',
          'districtId': 1,
          'provinceId': 1,
        },
        'street': 'Street A',
      },
    };

    UserInfo userInfo = UserInfo.fromMap(data);

    expect(userInfo.name, 'John Doe');
    expect(userInfo.email, 'johndoe@example.com');
    expect(userInfo.phoneNumber, '123456789');
    expect(userInfo.birthDate, DateTime(1990, 01, 01));

    expect(userInfo.address?.province?.id, 1);
    expect(userInfo.address?.province?.name, 'Province A');
    expect(userInfo.address?.province?.level, 'A');

    expect(userInfo.address?.district?.id, 1);
    expect(userInfo.address?.district?.name, 'District A');
    expect(userInfo.address?.district?.level, 'A');
    expect(userInfo.address?.district?.provinceId, 1);

    expect(userInfo.address?.ward?.id, 1);
    expect(userInfo.address?.ward?.name, 'Ward A');
    expect(userInfo.address?.ward?.level, 'A');
    expect(userInfo.address?.ward?.districtId, 1);
    expect(userInfo.address?.ward?.provinceId, 1);

    expect(userInfo.address?.street, 'Street A');
  });
}