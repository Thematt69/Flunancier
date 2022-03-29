// The Cloud Functions for Firebase SDK
// to create Cloud Functions and set up triggers.
const functions = require("firebase-functions");

// The Firebase Admin SDK to access Firestore.
const admin = require("firebase-admin");
admin.initializeApp();
const db = admin.firestore();

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

    functions.logger.log(newBalance);

    await accountRef.update({ total: newBalance });
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

    functions.logger.log(newBalance);

    await accountRef.update({ total: newBalance });
  });
