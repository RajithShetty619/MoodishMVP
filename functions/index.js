const functions = require('firebase-functions');
// const sh = require("ss-search");
// const fs = require('fs');
// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
exports.helloWorld = functions.https.onRequest((request, response) => {
    let req = request._read;
    console.log(req);
 response.send({some:"Hello from Firebase!"});
});
