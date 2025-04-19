const url ='http://localhost:5000/';
//Auth
const login ="${url}users/login";
const logout ="${url}/users/logout";
// Utilisateur
const  addEmployeur = "${url}/users/addUserEmployeur";
const  addEmployeurWithImg = "${url}/users/addUserEmployeurWithImg";
const  addAdmin = "${url}/users/addUserAdmin";
const  getAllUsers = "${url}/users/getAllUsers";
const  getUserById = "${url}/users/getUserById"; 
const  deleteUserById = "${url}/users/deleteUserById"; 
const  updateUserById = "${url}/users/updateUserById"; 
const  searchUserByUsername = "${url}/users/searchUserByUsername";
const  getUsersSortByAge = "${url}/users/getAllUsersSortByAge";
const  getUsersBetweenAges = "${url}/users/getAllUsersAgeBetMaxAgeMinAge";
const  getAllEmployeurs = "${url}/users/getAllEmployeur";
const  getAllAdmins = "${url}/users/getAllAdmin";
// preference 
const setOrUpdatePreference = "${url}preferences/setOrUpdatePreference";
