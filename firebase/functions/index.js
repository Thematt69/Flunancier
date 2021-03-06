// The Cloud Functions for Firebase SDK
// to create Cloud Functions and set up triggers.
const functions = require("firebase-functions");

// The Firebase Admin SDK to access Firestore.
const admin = require("firebase-admin");
admin.initializeApp();
const db = admin.firestore();

exports.addAccount = functions.firestore
  .document("accounts/{uid}")
  .onCreate(async (snap, context) => {
    const transactionRef = db.collection("accounts").doc(snap.id);
    await transactionRef.update({ uuid: snap.id });
  });

exports.addOperation = functions.firestore
  .document("transactions/{uid}")
  .onCreate(async (snap, context) => {
    let montant = snap.get("montant");
    let accountUuid = snap.get("accountUuid");

    functions.logger.log(montant);
    functions.logger.log(accountUuid);

    const accountRef = db.collection("accounts").doc(accountUuid);
    const doc = await accountRef.get();
    const data = doc.data();

    let newBalance = data["total"] + montant;

    newBalance = Math.round((newBalance + Number.EPSILON) * 100) / 100;

    functions.logger.log(newBalance);

    await accountRef.update({ total: newBalance });

    const transactionRef = db.collection("transactions").doc(snap.id);
    await transactionRef.update({ uuid: snap.id });
  });

exports.updateOperation = functions.firestore
  .document("transactions/{uid}")
  .onUpdate(async (change, context) => {
    let beforeMontant = change.before.get("montant");
    let afterMontant = change.after.get("montant");
    let accountUuid = change.before.get("accountUuid");

    functions.logger.log(beforeMontant);
    functions.logger.log(accountUuid);

    const accountRef = db.collection("accounts").doc(accountUuid);
    const doc = await accountRef.get();
    const data = doc.data();

    let newBalance = data["total"] + (afterMontant - beforeMontant);

    newBalance = Math.round((newBalance + Number.EPSILON) * 100) / 100;

    functions.logger.log(newBalance);

    await accountRef.update({ total: newBalance });
  });
