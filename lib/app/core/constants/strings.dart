class Strings{
  static const signUpApi ="https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$firebaseApiKey";
  static const signInApi="https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$firebaseApiKey";
  static const sendEmailVerification = "https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=$firebaseApiKey";
  static const confirmEmailVerification = "https://identitytoolkit.googleapis.com/v1/accounts:update?key=$firebaseApiKey";
  static const sendPasswordReset = "https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=$firebaseApiKey";
  static const getUserData ="https://identitytoolkit.googleapis.com/v1/accounts:lookup?key=$firebaseApiKey";
  static const refreshToken ="https://securetoken.googleapis.com/v1/token?key=$firebaseApiKey";
  static const getMovies = "https://netflix-bfc7b-default-rtdb.firebaseio.com/netflixMovies/allMovies.json";
  static const getComingSoonMovies = "https://netflix-bfc7b-default-rtdb.firebaseio.com/comingSoon/comingSoon.json";
  static const getAllDataMovies = "https://netflix-bfc7b-default-rtdb.firebaseio.com/allDataMovies/allDataMovies.json";
  static const getTrendingNowMovies = "https://netflix-bfc7b-default-rtdb.firebaseio.com/trendingNow.json";
  static const getPopularMovies = "https://netflix-bfc7b-default-rtdb.firebaseio.com/popularMovies/popularMovies.json";
  static const getTop10Movies = "https://netflix-bfc7b-default-rtdb.firebaseio.com/top10Movies.json";
}
const firebaseApiKey= "AIzaSyBtrUvMWv-L6u49pPM1yjTNi7n--kAOAwA";
const sharedTokenId = "token";
const sharedUserEmail = "email";
const  sharedUserVerification = "userVerification";