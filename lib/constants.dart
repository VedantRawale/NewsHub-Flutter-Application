import 'package:flutter/material.dart';

const backGrndClr = Color(0xFFF2F0E4);
// const cardClr = Color(0xFFDFD3C3);
// const apiKey = '69fadf5b71d44cb1b2112a3af23ee3dc';
const apiKey = '81d1853fef3d41ab9c63b665124cbbf7';
const stockapiurl =
    'https://latest-stock-price.p.rapidapi.com/price?Indices=NIFTY 50';
const stockapikey = 'b4080c9322msh0c4fb2c51b41812p1bac59jsn31f3a5f2b241';
const stockapihost = 'latest-stock-price.p.rapidapi.com';

Map<String, String> countryMap = {
  "ae": "UAE",
  "ar": "Argentina",
  "at": "Austria",
  "au": "Australia",
  "be": "Belgium",
  "br": "Brazil",
  "ca": "Canada",
  "ch": "Switzerland",
  "cn": "China",
  "co": "Colombia",
  "cz": "Czech Rb",
  "de": "Germany",
  "eg": "Egypt",
  "fr": "France",
  "gb": "UK",
  "gr": "Greece",
  "hk": "Hong Kong",
  "hu": "Hungary",
  "id": "Indonesia",
  "ie": "Ireland",
  "il": "Israel",
  "in": "India",
  "it": "Italy",
  "jp": "Japan",
  "kr": "South Korea",
  "lt": "Lithuania",
  "lv": "Latvia",
  "ma": "Morocco",
  "mx": "Mexico",
  "my": "Malaysia",
  "ng": "Nigeria",
  "nl": "Netherlands",
  "no": "Norway",
  "nz": "NZ",
  "ph": "Philippines",
  "pl": "Poland",
  "pt": "Portugal",
  "ro": "Romania",
  "rs": "Serbia",
  "ru": "Russia",
  "sa": "Saudi Arabia",
  "se": "Sweden",
  "sg": "Singapore",
  "sk": "Slovakia",
  "th": "Thailand",
  "tr": "Turkey",
  "tw": "Taiwan",
  "ua": "Ukraine",
  "us": "USA",
  "ve": "Venezuela",
  "za": "South Africa",
};

const lkdnlink =
    "https://media.licdn.com/dms/image/C5603AQGCdybUf9XRZA/profile-displayphoto-shrink_400_400/0/1668067929170?e=1706140800&v=beta&t=S24oCi1EHdKC2hJu1afz2Ce_BFrXU4hU_qkrcOBzS1E";

String usrId = "";
