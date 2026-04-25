import 'package:flutter/material.dart';

const Color backgroundColor = Color(0xFF000000);
const Color cardColor = Color(0xFF111111);
const Color borderColor = Color(0xFF1A1A1A);
const Color textColor = Color(0xFFFFFFFF);

const List<Map<String, String>> worldCupTeams = [
  {"name": "Argentina", "code": "AR", "flag": "https://flagcdn.com/w40/ar.png"},
  {"name": "Australia", "code": "AU", "flag": "https://flagcdn.com/w40/au.png"},
  {"name": "Austria", "code": "AT", "flag": "https://flagcdn.com/w40/at.png"},
  {"name": "Belgium", "code": "BE", "flag": "https://flagcdn.com/w40/be.png"},
  {"name": "Bolivia", "code": "BO", "flag": "https://flagcdn.com/w40/bo.png"},
  {"name": "Brazil", "code": "BR", "flag": "https://flagcdn.com/w40/br.png"},
  {"name": "Canada", "code": "CA", "flag": "https://flagcdn.com/w40/ca.png"},
  {"name": "Cape Verde", "code": "CV", "flag": "https://flagcdn.com/w40/cv.png"},
  {"name": "Colombia", "code": "CO", "flag": "https://flagcdn.com/w40/co.png"},
  {"name": "Croatia", "code": "HR", "flag": "https://flagcdn.com/w40/hr.png"},
  {"name": "Curaçao", "code": "CW", "flag": "https://flagcdn.com/w40/cw.png"},
  {"name": "DR Congo", "code": "CD", "flag": "https://flagcdn.com/w40/cd.png"},
  {"name": "Ecuador", "code": "EC", "flag": "https://flagcdn.com/w40/ec.png"},
  {"name": "Egypt", "code": "EG", "flag": "https://flagcdn.com/w40/eg.png"},
  {"name": "England", "code": "GB-ENG", "flag": "https://flagcdn.com/w40/gb-eng.png"},
  {"name": "France", "code": "FR", "flag": "https://flagcdn.com/w40/fr.png"},
  {"name": "Germany", "code": "DE", "flag": "https://flagcdn.com/w40/de.png"},
  {"name": "Ghana", "code": "GH", "flag": "https://flagcdn.com/w40/gh.png"},
  {"name": "Haiti", "code": "HT", "flag": "https://flagcdn.com/w40/ht.png"},
  {"name": "Iran", "code": "IR", "flag": "https://flagcdn.com/w40/ir.png"},
  {"name": "Iraq", "code": "IQ", "flag": "https://flagcdn.com/w40/iq.png"},
  {"name": "Ivory Coast", "code": "CI", "flag": "https://flagcdn.com/w40/ci.png"},
  {"name": "Jamaica", "code": "JM", "flag": "https://flagcdn.com/w40/jm.png"},
  {"name": "Japan", "code": "JP", "flag": "https://flagcdn.com/w40/jp.png"},
  {"name": "Jordan", "code": "JO", "flag": "https://flagcdn.com/w40/jo.png"},
  {"name": "Mexico", "code": "MX", "flag": "https://flagcdn.com/w40/mx.png"},
  {"name": "Morocco", "code": "MA", "flag": "https://flagcdn.com/w40/ma.png"},
  {"name": "Netherlands", "code": "NL", "flag": "https://flagcdn.com/w40/nl.png"},
  {"name": "New Caledonia", "code": "NC", "flag": "https://flagcdn.com/w40/nc.png"},
  {"name": "New Zealand", "code": "NZ", "flag": "https://flagcdn.com/w40/nz.png"},
  {"name": "Norway", "code": "NO", "flag": "https://flagcdn.com/w40/no.png"},
  {"name": "Panama", "code": "PA", "flag": "https://flagcdn.com/w40/pa.png"},
  {"name": "Paraguay", "code": "PY", "flag": "https://flagcdn.com/w40/py.png"},
  {"name": "Portugal", "code": "PT", "flag": "https://flagcdn.com/w40/pt.png"},
  {"name": "Qatar", "code": "QA", "flag": "https://flagcdn.com/w40/qa.png"},
  {"name": "Saudi Arabia", "code": "SA", "flag": "https://flagcdn.com/w40/sa.png"},
  {"name": "Scotland", "code": "GB-SCT", "flag": "https://flagcdn.com/w40/gb-sct.png"},
  {"name": "Senegal", "code": "SN", "flag": "https://flagcdn.com/w40/sn.png"},
  {"name": "South Africa", "code": "ZA", "flag": "https://flagcdn.com/w40/za.png"},
  {"name": "South Korea", "code": "KR", "flag": "https://flagcdn.com/w40/kr.png"},
  {"name": "Spain", "code": "ES", "flag": "https://flagcdn.com/w40/es.png"},
  {"name": "Suriname", "code": "SR", "flag": "https://flagcdn.com/w40/sr.png"},
  {"name": "Switzerland", "code": "CH", "flag": "https://flagcdn.com/w40/ch.png"},
  {"name": "Tunisia", "code": "TN", "flag": "https://flagcdn.com/w40/tn.png"},
  {"name": "United States", "code": "US", "flag": "https://flagcdn.com/w40/us.png"},
  {"name": "Uruguay", "code": "UY", "flag": "https://flagcdn.com/w40/uy.png"},
  {"name": "Uzbekistan", "code": "UZ", "flag": "https://flagcdn.com/w40/uz.png"},
];

int calculatePoints(int predictedA, int predictedB, int actualA, int actualB) {
  if (predictedA == actualA && predictedB == actualB) return 5;
  if (predictedA == actualA || predictedB == actualB) return 2;
  return 0;
}