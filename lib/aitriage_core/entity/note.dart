class Note {
  final int? id;
  final String? noteType;
  final dynamic title;
  final String? description;
  final int? logUserId;
  final String? logFullName;
  final int? customerId;
  final String? customerCode;
  final String? customerFullName;
  final String? dispStatus;
  final int? locationId;
  final int? accountId;
  final String? accountNo;
  final String? createdAt;

  Note.fromJson(dynamic json)
      : id = json?['id'],
        noteType = json?['noteType'],
        title = json?['title'],
        description = json?['description'],
        logUserId = json?['logUserId'],
        logFullName = json?['logFullName'],
        customerId = json?['customerId'],
        customerCode = json?['customerCode'],
        customerFullName = json?['customerFullName'],
        dispStatus = json?['dispStatus'],
        locationId = json?['locationId'],
        accountId = json?['accountId'],
        accountNo = json?['accountNo'],
        createdAt = json?['createdAt'];
}