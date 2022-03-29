import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flunancier/blocs/bloc_provider.dart';
import 'package:flunancier/models/account.dart';
import 'package:flunancier/models/transaction.dart' as t;

class StoreBloc extends BlocBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// Collection pour la table `accounts` avec la conversion via le model `Account`
  final CollectionReference<Account> _accountCollectionReference =
      FirebaseFirestore.instance
          .collection(Account.collectionName)
          .withConverter<Account>(
            fromFirestore: (snapshot, _) =>
                Account.fromFireStore(snapshot.data()!),
            toFirestore: (value, _) => value.toFirestore(),
          );

  Stream<List<Account>> get onAccountsChange => _accountCollectionReference
      .where(
        Account.entryUserId,
        isEqualTo: _firebaseAuth.currentUser?.uid,
      )
      .orderBy(Account.entryName)
      .snapshots()
      .map((event) => event.docs.map((e) => e.data()).toList());

  Stream<Account> onAccountsChangeFromUuid(String uuid) =>
      _accountCollectionReference
          .where(Account.entryUuid, isEqualTo: uuid)
          .orderBy(Account.entryName)
          .snapshots()
          .map((event) => event.docs.first.data());

  /// Collection pour la table `transactions` avec la conversion via le model `Transaction`
  final CollectionReference<t.Transaction> _transactionCollectionReference =
      FirebaseFirestore.instance
          .collection(t.Transaction.collectionName)
          .withConverter<t.Transaction>(
            fromFirestore: (snapshot, _) =>
                t.Transaction.fromFireStore(snapshot.data()!),
            toFirestore: (value, _) => value.toFirestore(),
          );

  Stream<List<t.Transaction>> onTransactionChange(Account account) =>
      _transactionCollectionReference
          .where(
            t.Transaction.entryAccountUuid,
            isEqualTo: account.uuid,
          )
          .orderBy(t.Transaction.entryDateTime, descending: true)
          .snapshots()
          .map((event) => event.docs.map((e) => e.data()).toList());

  Future<void> addTransaction(t.Transaction transaction) async {
    final docRef = await _transactionCollectionReference.add(transaction);
    await _transactionCollectionReference.doc(docRef.id).update({
      t.Transaction.entryUuid: docRef.id,
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void initState() {
    // TODO: implement initState
  }
}
