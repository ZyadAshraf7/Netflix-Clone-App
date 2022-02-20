class Strings{
  static const signUpApi ="https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$firebaseApiKey";
  static const signInApi="https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$firebaseApiKey";
  static const sendEmailVerification = "https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=$firebaseApiKey";
  static const confirmEmailVerification = "https://identitytoolkit.googleapis.com/v1/accounts:update?key=$firebaseApiKey";
}
const firebaseApiKey= "AIzaSyBtrUvMWv-L6u49pPM1yjTNi7n--kAOAwA";
const sharedTokenId = "token";
const sharedUserEmail = "email";
const  sharedUserVerification = "userVerification";