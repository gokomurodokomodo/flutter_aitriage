import 'package:flutter_aitriage/aitriage_core/entity/table_sync_date.dart';
import '../../../../network/provider/firebase_provider.dart';

class GetFirebaseSyncs {
  Stream<TableSyncDate> execute() {
    return FirebaseProvider.getOneItemOn(FirebaseCollection.syncs.path, (result) => TableSyncDate.fromJson(result));
  }
}