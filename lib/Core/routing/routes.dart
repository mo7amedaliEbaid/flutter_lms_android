import 'package:flutter/material.dart';
import 'package:flutter_lms/Core/Network/local_Network.dart';
import 'package:flutter_lms/Core/utils/support.dart';
import 'package:flutter_lms/Feature/askreya/views/askreya.dart';
import 'package:flutter_lms/Feature/askreya/views/askreyaa.dart';
import 'package:flutter_lms/Feature/exam/views/exam-final.dart';
import 'package:flutter_lms/Feature/exam/views/exam-medterm.dart';
import 'package:flutter_lms/Feature/glos/views/glos.dart';
import 'package:flutter_lms/Feature/glos/views/gloss.dart';
import 'package:flutter_lms/Feature/lagna/views/lagna.dart';
import 'package:flutter_lms/Feature/lagna/views/lagnaa.dart';
import 'package:flutter_lms/Feature/mahad/views/hadaf.dart';
import 'package:flutter_lms/Feature/mahad/views/mahad.dart';
import 'package:flutter_lms/Feature/mahad/views/mn-mahad.dart';
import 'package:flutter_lms/Feature/mahad/views/amed.dart';
import 'package:flutter_lms/Feature/mahad/views/moshref.dart';
import 'package:flutter_lms/Feature/mahad/views/seyasa.dart';
import 'package:flutter_lms/Feature/mahad/views/tadres.dart';
import 'package:flutter_lms/Feature/natega/views/natega-tkalf.dart';
import 'package:flutter_lms/Feature/natega/views/natega-trakomy.dart';
import 'package:flutter_lms/Feature/natega/views/natega.dart';
import 'package:flutter_lms/Feature/natega/views/nategaa.dart';
import 'package:flutter_lms/Feature/table-em/views/table-em.dart';
import 'package:flutter_lms/Feature/table-em/views/table.dart';
import 'package:flutter_lms/Feature/table-em/views/team.dart';
import 'package:flutter_lms/Feature/table/views/skashen.dart';
import 'package:flutter_lms/Feature/table/views/table-mohadrat.dart';
import 'package:flutter_lms/Feature/exam/views/exam-tkalf.dart';
import 'package:flutter_lms/Feature/Auth_Feature/presentation/views/login.dart';
import 'package:flutter_lms/Feature/exam/views/not-exam.dart';
import 'package:flutter_lms/Feature/welcome/views/welcome.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  "/": (context) => token == '' || token == null ? Login() : const Welcome(),
  // "/welcome": (context) => Welcome(),
  "/table": (context) => const Tableex(),
  "/team": (context) => const Team(),
  "/support": (context) => const Support(),
  "/lagna": (context) => const Lagna(),
  "/glos": (context) => const Glos(),
  "/askreya": (context) => const Askreya(),
  "/askreyaa": (context) => const Askreyaa(),
  "/natega": (context) => const Natega(),
  "/nategaa": (context) => const Nategaa(),
  //"/natega-tkalf": (context) => const NategaaTkalf(),
  "/lagnaa": (context) => const Lagnaa(),
  "/gloss": (context) => const Gloss(),
  "/mahad": (context) => const Mahad(),
  "/natega-trakomy": (context) => const NategaaTrakomy(),
  "/tadres": (context) => const Tadres(),
  "/table-em": (context) => const Tableexam(),
  "/not-exam": (context) => const Notexam(),
  "/exam-tkalf": (context) => const ExamTkalf(),
  "/exam-medterm": (context) => const ExamMedterm(),
  "/exam-final": (context) => const ExamFinal(),
  "/table-mohadrat": (context) => const TableMohadrat(),
  "/mn-mahad": (context) => const MnMahad(),
  "/hadaf": (context) => const Hadaf(),
  "/seyasa": (context) => const Seyasa(),
  "/skashen": (context) => const Skashen(),
  "/amed": (context) => const Amed(),
  "/moshref": (context) => const Moshref(),
};
