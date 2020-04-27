-- sources : https://fr.wikipedia.org/wiki/Liste_des_d%C3%A9partements_fran%C3%A7ais donnees de 2016 pour les populations par departement.
-- https://www.mockaroo.com/ pour la generation de donnees

-- on insere des departements, des patients (avec l'insertion d'une surveilance pour chaque patient) et des hopitaux.

INSERT INTO departement (idDep, nbHabitant, seuilPersContamine, nomDep) VALUES
(1, 638425, 5, 'Ain'),
(2, 536136, 5, 'Aisne'),
(3, 339384, 5, 'Allier'),
(4, 162565, 5, 'Alpes-de-Haute-Provence'),
(5, 141107, 5, 'Hautes-Alpes'),
(6, 1083704, 5, 'Alpes-Maritimes'),
(7, 325157, 5, 'Ardèche'),
(8, 275371, 5, 'Ardennes'),
(9, 153067, 5, 'Ariège'),
(10, 308910, 5, 'Aube'),
(11, 368025, 5, 'Aude'),
(12, 278697, 5, 'Aveyron'),
(13, 2019717, 5, 'Bouches-du-Rhône'),
(14, 693679, 5, 'Calvados'),
(15, 145969, 5, 'Cantal'),
(16, 353288, 5, 'Charente'),
(17, 642191, 5, 'Charente-Maritime'),
(18, 307110, 5, 'Cher'),
(19, 241535, 5, 'Corrèze'),
(20, 330445, 5, 'Corse'),
(21, 533213, 5, 'Côte-d''Or'),
(22, 598953, 5, 'Côtes-d''Armor'),
(23, 119502, 5, 'Creuse'),
(24, 414789, 5, 'Dordogne'),
(25, 538549, 5, 'Doubs'),
(26, 508006, 5, 'Drôme'),
(27, 602825, 5, 'Eure'),
(28, 433929, 5, 'Eure-et-Loir'),
(29, 908249, 5, 'Finistère'),
(30, 742006, 5, 'Gard'),
(31, 1348183, 5, 'Haute-Garonne'),
(32, 190664, 5, 'Gers'),
(33, 1566679, 5, 'Gironde'),
(34, 1132481, 5, 'Hérault'),
(35, 1051779, 5, 'Ille-et-Vilaine'),
(36, 223505, 5, 'Indre'),
(37, 606223, 5, 'Indre-et-Loire'),
(38, 1252912, 5, 'Isère'),
(39, 260517, 5, 'Jura'),
(40, 405010, 5, 'Landes'),
(41, 332769, 5, 'Loir-et-Cher'),
(42, 761997, 5, 'Loire'),
(43, 227339, 5, 'Haute-Loire'),
(44, 1380852, 5, 'Loire-Atlantique'),
(45, 674330, 5, 'Loiret'),
(46, 173347, 5, 'Lot'),
(47, 332833, 5, 'Lot-et-Garonne'),
(48, 76422, 5, 'Lozère'),
(49, 810934, 5, 'Maine-et-Loire'),
(50, 498362, 5, 'Manche'),
(51, 570883, 5, 'Marne'),
(52, 178084, 5, 'Haute-Marne'),
(53, 307688, 5, 'Mayenne'),
(54, 733821, 5, 'Meurthe-et-Moselle'),
(55, 189055, 5, 'Meuse'),
(56, 747548, 5, 'Morbihan'),
(57, 1045271, 5, 'Moselle'),
(58, 209161, 5, 'Nièvre'),
(59, 2603723, 5, 'Nord'),
(60, 823542, 5, 'Oise'),
(61, 285308, 5, 'Orne'),
(62, 1470725, 5, 'Pas-de-Calais'),
(63, 650700, 5, 'Puy-de-Dôme'),
(64, 673986, 5, 'Pyrénées-Atlantiques'),
(65, 227829, 5, 'Hautes-Pyrénées'),
(66, 474369, 5, 'Pyrénées-Orientales'),
(67, 1121407, 5, 'Bas-Rhin'),
(68, 762743, 5, 'Haut-Rhin'),
(69, 1835903, 5, 'Circonscription départementale du Rhône'),
(70, 237242, 5, 'Haute-Saône'),
(71, 555023, 5, 'Saône-et-Loire'),
(72, 567561, 5, 'Sarthe'),
(73, 429681, 5, 'Savoie'),
(74, 801416, 5, 'Haute-Savoie'),
(75, 2190327, 5, 'Paris'),
(76, 1255755, 5, 'Seine-Maritime'),
(77, 1397665, 5, 'Seine-et-Marne'),
(78, 1431808, 5, 'Yvelines'),
(79, 374743, 5, 'Deux-Sèvres'),
(80, 572744, 5, 'Somme'),
(81, 386448, 5, 'Tarn'),
(82, 256897, 5, 'Tarn-et-Garonne'),
(83, 1055821, 5, 'Var'),
(84, 559014, 5, 'Vaucluse'),
(85, 670597, 5, 'Vendée'),
(86, 436069, 5, 'Vienne'),
(87, 374978, 5, 'Haute-Vienne'),
(88, 369641, 5, 'Vosges'),
(89, 340544, 5, 'Yonne'),
(90, 144089, 5, 'Territoire de Belfort'),
(91, 1287330, 5, 'Essonne'),
(92, 1603268, 5, 'Hauts-de-Seine'),
(93, 1606660, 5, 'Seine-Saint-Denis'),
(94, 1378151, 5, 'Val-de-Marne'),
(95, 1221923, 5, 'Val-d''Oise'),
(971, 394110, 5, 'Guadeloupe'),
(972, 376480, 5, 'Martinique'),
(973, 269352, 5, 'Guyane'),
(974, 852924, 5, 'La Réunion'),
(976, 256518, 5, 'Mayotte');


-- insertions des patients via ajouter_patient.
-- chaque appel fait une insertion dans la table patient et une insertion dans la table surveillance
select ajouter_patient(1737451002231, 'Wynn', 'Tawse', '1996-07-13', 'A', 7076268425, NULL, 'wtawse0@indiatimes.com', 21);
select ajouter_patient(9615394801429, 'Jermaine', 'Mouth', '1998-04-22', 'A', 9580878303, NULL, 'jmouth1@apple.com', 84);
select ajouter_patient(1581656437224, 'Peyter', 'Wrintmore', '1989-08-27', 'H', 2497963298, NULL, 'pwrintmore2@nationalgeographic.com', 46);
select ajouter_patient(3806845530209, 'Roland', 'Kincaid', '1971-02-18', 'H', 9535136776, NULL, 'rkincaid3@geocities.com', 69);
select ajouter_patient(9646641779489, 'Cecilla', 'Summerell', '2006-11-11', 'H', 4546017148, NULL, 'csummerell4@goodreads.com', 93);
select ajouter_patient(8893560638175, 'Bondon', 'Wraxall', '1930-06-16', 'A', 1584558420, NULL, 'bwraxall5@answers.com', 53);
select ajouter_patient(9748018622751, 'Jae', 'Clifft', '1922-07-16', 'F', 3233685137, NULL, 'jclifft6@cloudflare.com', 19);
select ajouter_patient(9322578504964, 'Benedetta', 'Feldfisher', '1999-04-05', 'H', 7918575059, NULL, 'bfeldfisher7@joomla.org', 40);
select ajouter_patient(60101923235, 'Montague', 'Heyball', '1986-04-30', 'A', 9766379622, NULL, 'mheyball8@meetup.com', 55);
select ajouter_patient(5674941616929, 'Gradeigh', 'Sebring', '1923-04-12', 'A', 2748196643, NULL, 'gsebring9@360.cn', 63);
select ajouter_patient(637012878671, 'Sheffield', 'Gorke', '1956-03-27', 'F', 1315886383, NULL, 'sgorkea@bbc.co.uk', 20);
select ajouter_patient(7003296454089, 'Alisa', 'McKenzie', '1996-11-27', 'A', 1451188941, NULL, 'amckenzieb@webeden.co.uk', 87);
select ajouter_patient(987408881322, 'Max', 'Wheal', '2005-08-20', 'F', 3408830803, NULL, 'mwhealc@about.me', 10);
select ajouter_patient(6072748163393, 'Skyler', 'Kenealy', '1961-02-09', 'F', 8727411738, NULL, 'skenealyd@usatoday.com', 23);
select ajouter_patient(6190393603068, 'Shalna', 'Preto', '2001-08-03', 'A', 8782901456, NULL, 'spretoe@dyndns.org', 4);
select ajouter_patient(2515766783079, 'Sharyl', 'Craigg', '1996-02-15', 'A', 1090794941, NULL, 'scraiggf@webs.com', 10);
select ajouter_patient(7651524212151, 'Gianina', 'Troubridge', '1924-01-30', 'A', 8207624849, NULL, 'gtroubridgeg@thetimes.co.uk', 46);
select ajouter_patient(8505892054231, 'Roze', 'Camplejohn', '1944-12-10', 'A', 2417470244, NULL, 'rcamplejohnh@netlog.com', 61);
select ajouter_patient(6001652023390, 'Lorri', 'O''Fergus', '1994-02-01', 'H', 6094317882, NULL, 'lofergusi@tmall.com', 79);
select ajouter_patient(8854817602613, 'Lyndsey', 'Verdey', '1982-03-11', 'A', 2900714376, NULL, 'lverdeyj@yahoo.com', 5);
select ajouter_patient(3887154026691, 'Skyler', 'Cardenas', '2017-12-10', 'H', 7247065459, NULL, 'scardenask@nba.com', 20);
select ajouter_patient(5575972790516, 'Brandi', 'Mumford', '1942-02-09', 'H', 559012907, NULL, 'bmumfordl@w3.org', 1);
select ajouter_patient(6977141092840, 'Nikolai', 'McFadyen', '1958-03-01', 'A', 6217353851, NULL, 'nmcfadyenm@fotki.com', 18);
select ajouter_patient(2289762920212, 'Bruce', 'Gamage', '1974-10-01', 'H', 4366535189, NULL, 'bgamagen@europa.eu', 45);
select ajouter_patient(3594440921987, 'Danyette', 'Mc Grath', '1993-05-05', 'A', 8680858778, NULL, 'dmcgratho@storify.com', 39);
select ajouter_patient(3236755458029, 'Lesya', 'Dalliwatr', '1929-03-12', 'A', 3781234952, NULL, 'ldalliwatrp@mysql.com', 40);
select ajouter_patient(4746530135962, 'Tierney', 'Godfree', '1946-10-30', 'A', 4687219563, NULL, 'tgodfreeq@sfgate.com', 22);
select ajouter_patient(6020778469455, 'Rolfe', 'Heminsley', '1959-11-29', 'F', 3272184564, NULL, 'rheminsleyr@narod.ru', 68);
select ajouter_patient(8293831300658, 'Hank', 'Spur', '2001-06-07', 'A', 4606263735, NULL, 'hspurs@fda.gov', 59);
select ajouter_patient(4067405350680, 'Godfrey', 'Truman', '1969-02-23', 'F', 6078511469, NULL, 'gtrumant@taobao.com', 50);
select ajouter_patient(4194631373673, 'Latashia', 'Bastick', '1978-11-30', 'A', 1269833544, NULL, 'lbasticku@lulu.com', 4);
select ajouter_patient(7302750043250, 'Sauncho', 'Trimble', '1996-10-16', 'A', 4290622961, NULL, 'strimblev@illinois.edu', 2);
select ajouter_patient(4018132761437, 'Raimundo', 'Bellam', '1956-12-25', 'A', 6084210068, NULL, 'rbellamw@gmpg.org', 20);
select ajouter_patient(321998431527, 'Amity', 'Gallehawk', '1965-03-20', 'A', 7755456001, NULL, 'agallehawkx@paginegialle.it', 31);
select ajouter_patient(3721965713825, 'Valencia', 'Jenicek', '1924-08-06', 'H', 260731504, NULL, 'vjeniceky@i2i.jp', 93);
select ajouter_patient(8302764193488, 'Carmelia', 'O''Garmen', '1978-08-18', 'H', 9761090953, NULL, 'cogarmenz@unicef.org', 18);
select ajouter_patient(3632857170634, 'Demetre', 'Adey', '1935-11-11', 'F', 5747500767, NULL, 'dadey10@ask.com', 25);
select ajouter_patient(8808513092999, 'Cointon', 'Stothard', '2001-06-17', 'A', 7602384610, NULL, 'cstothard11@adobe.com', 54);
select ajouter_patient(8185112192673, 'Connor', 'Mossman', '1984-01-30', 'A', 8112533718, NULL, 'cmossman12@columbia.edu', 13);
select ajouter_patient(7514746556763, 'Leslie', 'Nattriss', '1954-09-09', 'A', 3402104198, NULL, 'lnattriss13@goodreads.com', 67);
select ajouter_patient(1352299613193, 'Burton', 'Daniel', '1928-12-30', 'F', 1885515992, NULL, 'bdaniel14@netscape.com', 58);
select ajouter_patient(5461795239386, 'Corbett', 'Tatlow', '1988-04-19', 'F', 6135717196, NULL, 'ctatlow15@multiply.com', 41);
select ajouter_patient(496979936510, 'Martie', 'Jiri', '1979-03-30', 'A', 8418030149, NULL, 'mjiri16@bluehost.com', 76);
select ajouter_patient(3457906386232, 'Josie', 'Gaylor', '1952-10-11', 'A', 8903608648, NULL, 'jgaylor17@domainmarket.com', 18);
select ajouter_patient(408088863477, 'Amery', 'Catterall', '2015-07-04', 'H', 8091072738, NULL, 'acatterall18@gov.uk', 47);
select ajouter_patient(5080497493060, 'Jacklyn', 'Merwe', '2019-12-17', 'A', 7047089897, NULL, 'jmerwe19@who.int', 68);
select ajouter_patient(3422821974055, 'Evelyn', 'Dunsford', '1990-08-07', 'A', 6689721472, NULL, 'edunsford1a@ask.com', 72);
select ajouter_patient(6453752182847, 'Noell', 'Lascell', '2006-03-12', 'F', 7989682483, NULL, 'nlascell1b@ca.gov', 87);
select ajouter_patient(8121176441588, 'Ingaberg', 'Dagger', '1940-05-20', 'F', 2851133378, NULL, 'idagger1c@intel.com', 55);
select ajouter_patient(7438225039009, 'Oberon', 'Somerbell', '1995-01-27', 'A', 4138365653, NULL, 'osomerbell1d@oracle.com', 68);
select ajouter_patient(57541212462, 'Osgood', 'Trobe', '1930-12-09', 'A', 6085024696, NULL, 'otrobe1e@china.com.cn', 92);
select ajouter_patient(8897513633108, 'Jase', 'Bartoleyn', '1955-12-18', 'A', 36881892, NULL, 'jbartoleyn1f@friendfeed.com', 62);
select ajouter_patient(6188381762776, 'Griff', 'Duffill', '1960-10-13', 'H', 4647957181, NULL, 'gduffill1g@microsoft.com', 62);
select ajouter_patient(2518320048792, 'Rodrique', 'Baudassi', '2009-02-21', 'A', 6235025426, NULL, 'rbaudassi1h@mysql.com', 56);
select ajouter_patient(8343248435633, 'Florella', 'Fowkes', '1999-01-24', 'A', 67922940, NULL, 'ffowkes1i@delicious.com', 85);
select ajouter_patient(1395726390930, 'Jeannette', 'Lohrensen', '1943-04-22', 'A', 8950719951, NULL, 'jlohrensen1j@webs.com', 90);
select ajouter_patient(1618047220657, 'Tripp', 'MacCrossan', '1957-05-06', 'F', 5107876640, NULL, 'tmaccrossan1k@sun.com', 54);
select ajouter_patient(873284682197, 'Paige', 'Kittredge', '1974-09-28', 'F', 2941682757, NULL, 'pkittredge1l@hubpages.com', 88);
select ajouter_patient(8333632281443, 'Carey', 'Priditt', '1922-01-01', 'A', 5252110343, NULL, 'cpriditt1m@ucsd.edu', 50);
select ajouter_patient(3149096278634, 'Tracy', 'Piddock', '2000-05-28', 'A', 965812094, NULL, 'tpiddock1n@oaic.gov.au', 24);
select ajouter_patient(7437107169384, 'Whitman', 'Coghlin', '2000-05-06', 'A', 6588557577, NULL, 'wcoghlin1o@ucoz.ru', 48);
select ajouter_patient(4382934048268, 'Vicki', 'McCabe', '1922-12-15', 'A', 7617631176, NULL, 'vmccabe1p@google.ca', 12);
select ajouter_patient(8343696453912, 'Osbert', 'Letixier', '1949-08-13', 'F', 9416890246, NULL, 'oletixier1q@so-net.ne.jp', 8);
select ajouter_patient(4470990946724, 'Kimball', 'Klimt', '2000-07-06', 'A', 188595718, NULL, 'kklimt1r@163.com', 79);
select ajouter_patient(5632685654729, 'Rod', 'De La Cote', '1937-11-03', 'A', 3375022166, NULL, 'rdelacote1s@ucsd.edu', 58);
select ajouter_patient(3914940594984, 'Whitby', 'Balls', '1991-10-11', 'A', 9452547936, NULL, 'wballs1t@nationalgeographic.com', 87);
select ajouter_patient(6196644555674, 'Connie', 'Craker', '1979-01-07', 'A', 1704635037, NULL, 'ccraker1u@so-net.ne.jp', 25);
select ajouter_patient(3641458383121, 'Shawn', 'Petchell', '1962-04-23', 'H', 7958387499, NULL, 'spetchell1v@biglobe.ne.jp', 22);
select ajouter_patient(4076328111091, 'Ulick', 'Gaish', '1993-01-30', 'H', 5654112118, NULL, 'ugaish1w@uol.com.br', 83);
select ajouter_patient(5895438179992, 'Devlen', 'Esel', '1923-08-31', 'A', 6908462956, NULL, 'desel1x@umich.edu', 78);
select ajouter_patient(9186209797095, 'Iorgo', 'Kleiner', '1923-12-14', 'F', 1113912990, NULL, 'ikleiner1y@stumbleupon.com', 24);
select ajouter_patient(7085472005906, 'Orelee', 'Easlea', '1953-06-30', 'H', 5909582497, NULL, 'oeaslea1z@si.edu', 16);
select ajouter_patient(6341888647048, 'Donielle', 'Vauter', '1925-07-01', 'H', 5796406611, NULL, 'dvauter20@elegantthemes.com', 21);
select ajouter_patient(7843179533916, 'Deane', 'McQuarter', '2017-07-03', 'A', 570581893, NULL, 'dmcquarter21@theatlantic.com', 32);
select ajouter_patient(1221613140623, 'Lindsay', 'Jumonet', '2001-05-23', 'F', 1589747297, NULL, 'ljumonet22@godaddy.com', 28);
select ajouter_patient(2718351567868, 'Burlie', 'Yitshak', '1940-09-15', 'F', 897222227, NULL, 'byitshak23@instagram.com', 19);
select ajouter_patient(2798435056289, 'Menard', 'Luc', '2009-09-18', 'A', 9798064386, NULL, 'mluc24@uiuc.edu', 18);
select ajouter_patient(5855629155679, 'Elaine', 'Bowman', '1945-07-06', 'A', 9033053493, NULL, 'ebowman25@woothemes.com', 23);
select ajouter_patient(2832058987199, 'Inness', 'Slateford', '1982-01-16', 'A', 5406532770, NULL, 'islateford26@reuters.com', 34);
select ajouter_patient(5624757651767, 'Emeline', 'Wellbeloved', '2020-02-21', 'H', 2395743457, NULL, 'ewellbeloved27@ebay.co.uk', 35);
select ajouter_patient(7566962981598, 'Liane', 'Fetherstone', '1998-10-07', 'A', 9253235277, NULL, 'lfetherstone28@artisteer.com', 51);
select ajouter_patient(1042711994279, 'Charlot', 'Earry', '2009-03-21', 'F', 7968685707, NULL, 'cearry29@scientificamerican.com', 24);
select ajouter_patient(6159575954179, 'Maddalena', 'Caseborne', '2012-08-05', 'A', 4115766341, NULL, 'mcaseborne2a@com.com', 54);
select ajouter_patient(4425310828594, 'Leanora', 'Sumpner', '2011-05-02', 'A', 5154450367, NULL, 'lsumpner2b@narod.ru', 49);
select ajouter_patient(1478356026440, 'Maureene', 'Stocks', '1999-10-20', 'F', 3187711051, NULL, 'mstocks2c@wisc.edu', 42);
select ajouter_patient(7060295367789, 'Karalee', 'Maus', '2002-10-08', 'F', 9442561453, NULL, 'kmaus2d@irs.gov', 50);
select ajouter_patient(8692632222597, 'Ludvig', 'Ellyatt', '1936-05-11', 'F', 4986823092, NULL, 'lellyatt2e@nytimes.com', 64);
select ajouter_patient(9376381269629, 'Pippo', 'Memmory', '1926-12-08', 'A', 9489533089, NULL, 'pmemmory2f@imdb.com', 91);
select ajouter_patient(8749058064422, 'Jodi', 'Fayerman', '1930-04-02', 'A', 2071528696, NULL, 'jfayerman2g@google.co.uk', 93);
select ajouter_patient(9137554368424, 'Kaja', 'Showt', '1999-07-22', 'A', 5588850380, NULL, 'kshowt2h@prnewswire.com', 15);
select ajouter_patient(9132433231026, 'Dannie', 'Petrishchev', '1945-01-29', 'A', 9049888199, NULL, 'dpetrishchev2i@addtoany.com', 38);
select ajouter_patient(8289943397533, 'Sasha', 'Farrears', '1989-10-03', 'A', 4081854167, NULL, 'sfarrears2j@youku.com', 33);
select ajouter_patient(2998683204292, 'Kira', 'MacVagh', '2011-04-20', 'A', 1395753703, NULL, 'kmacvagh2k@phoca.cz', 1);
select ajouter_patient(9123035973318, 'Chancey', 'Matussow', '1962-06-14', 'A', 4596599536, NULL, 'cmatussow2l@google.co.uk', 7);
select ajouter_patient(2576415281734, 'Clay', 'Dainter', '1956-06-13', 'H', 3486428797, NULL, 'cdainter2m@ameblo.jp', 84);
select ajouter_patient(7453018186363, 'Toby', 'Station', '2017-07-12', 'A', 9051601366, NULL, 'tstation2n@cpanel.net', 93);
select ajouter_patient(3000792841199, 'Roderic', 'Datte', '1966-01-11', 'H', 3851050271, NULL, 'rdatte2o@huffingtonpost.com', 89);
select ajouter_patient(6162639424163, 'Gui', 'Soans', '1939-08-22', 'H', 4062620088, NULL, 'gsoans2p@so-net.ne.jp', 75);
select ajouter_patient(4911775547983, 'Lorraine', 'Gennerich', '1957-03-06', 'F', 5903012880, NULL, 'lgennerich2q@mapy.cz', 4);
select ajouter_patient(198570790663, 'Thatch', 'Bilverstone', '2009-02-12', 'A', 8285294846, NULL, 'tbilverstone2r@sun.com', 25);
select ajouter_patient(2226840764224, 'Bourke', 'Schrader', '1992-06-08', 'H', 8315183886, NULL, 'bschrader2s@un.org', 73);
select ajouter_patient(1403270066938, 'Eba', 'Mcsarry', '1963-05-05', 'H', 6324889533, NULL, 'emcsarry2t@vimeo.com', 56);
select ajouter_patient(5104353313945, 'Felecia', 'Kruschov', '1955-07-18', 'A', 6319487844, NULL, 'fkruschov2u@printfriendly.com', 59);
select ajouter_patient(5290280988980, 'Norean', 'MacIllrick', '1988-04-27', 'A', 1726654299, NULL, 'nmacillrick2v@delicious.com', 49);
select ajouter_patient(7576579251291, 'Adolf', 'Pitkeathley', '1946-11-09', 'A', 8739668156, NULL, 'apitkeathley2w@marriott.com', 47);
select ajouter_patient(1130118786450, 'Milty', 'Adanez', '2003-10-18', 'F', 4639224048, NULL, 'madanez2x@elegantthemes.com', 81);
select ajouter_patient(2869525958606, 'Aidan', 'Sanders', '1988-03-28', 'F', 9372152659, NULL, 'asanders2y@issuu.com', 72);
select ajouter_patient(9700022376416, 'Delilah', 'Starmore', '1995-02-22', 'A', 2635559709, NULL, 'dstarmore2z@examiner.com', 22);
select ajouter_patient(4482310957636, 'Nelly', 'Couch', '1958-09-28', 'A', 6134398187, NULL, 'ncouch30@adobe.com', 56);
select ajouter_patient(5110575124186, 'Maximilian', 'Nan Carrow', '2008-08-21', 'F', 2610475639, NULL, 'mnancarrow31@creativecommons.org', 51);
select ajouter_patient(884197470254, 'Chrisy', 'Alyukin', '1968-05-10', 'F', 6211984532, NULL, 'calyukin32@list-manage.com', 42);
select ajouter_patient(7464678527314, 'Renell', 'Vaudrey', '1972-10-11', 'F', 2750878629, NULL, 'rvaudrey33@reverbnation.com', 57);
select ajouter_patient(1753755456642, 'Thea', 'Probets', '1975-03-19', 'H', 5011259623, NULL, 'tprobets34@usatoday.com', 85);
select ajouter_patient(7770925289858, 'Noemi', 'MacPhail', '1937-11-14', 'A', 1648546325, NULL, 'nmacphail35@indiegogo.com', 61);
select ajouter_patient(6375096315659, 'Giffer', 'Spinney', '1920-06-26', 'F', 6296437036, NULL, 'gspinney36@lulu.com', 76);
select ajouter_patient(1376811812326, 'Irvine', 'Gentry', '2004-06-29', 'F', 1097957537, NULL, 'igentry37@blinklist.com', 74);
select ajouter_patient(5883678492684, 'Joana', 'Hupe', '1953-11-21', 'H', 781599213, NULL, 'jhupe38@jugem.jp', 89);
select ajouter_patient(5255965984222, 'Wilfrid', 'Eates', '1921-10-19', 'A', 6035715241, NULL, 'weates39@newyorker.com', 22);
select ajouter_patient(5864810504203, 'Hurleigh', 'Bradlaugh', '1929-03-05', 'A', 6973813292, NULL, 'hbradlaugh3a@dedecms.com', 48);
select ajouter_patient(8118972052853, 'Merrel', 'Casella', '1921-07-07', 'F', 3470064189, NULL, 'mcasella3b@fema.gov', 63);
select ajouter_patient(4257349065551, 'Honoria', 'Varren', '1953-06-14', 'A', 3443945913, NULL, 'hvarren3c@marketwatch.com', 75);
select ajouter_patient(6161878512109, 'Elke', 'Dobing', '1985-05-31', 'A', 6139294601, NULL, 'edobing3d@globo.com', 6);
select ajouter_patient(673054829208, 'Hermy', 'Bagniuk', '1966-04-04', 'A', 795465286, NULL, 'hbagniuk3e@cnet.com', 74);
select ajouter_patient(5514113519758, 'Foss', 'Spata', '1987-10-11', 'F', 4534947050, NULL, 'fspata3f@facebook.com', 52);
select ajouter_patient(9416625452997, 'Germaine', 'Isley', '1946-11-05', 'A', 163489568, NULL, 'gisley3g@scientificamerican.com', 73);
select ajouter_patient(6513111135179, 'Ashli', 'Cordeiro', '2001-02-21', 'A', 2430060517, NULL, 'acordeiro3h@eepurl.com', 28);
select ajouter_patient(3831953400271, 'Yurik', 'Ivkovic', '1963-02-17', 'H', 7730279497, NULL, 'yivkovic3i@reuters.com', 25);
select ajouter_patient(142465106974, 'Adam', 'Aleksic', '1998-06-23', 'A', 1005665965, NULL, 'aaleksic3j@columbia.edu', 88);
select ajouter_patient(157675954933, 'Orelie', 'Mico', '1945-08-16', 'A', 5023892964, NULL, 'omico3k@typepad.com', 92);
select ajouter_patient(5144566034165, 'Minetta', 'Bravey', '1945-01-27', 'H', 7900423058, NULL, 'mbravey3l@google.com.hk', 94);
select ajouter_patient(9727077745689, 'Arnoldo', 'Hawkswell', '1959-01-22', 'F', 7883058573, NULL, 'ahawkswell3m@ucla.edu', 79);
select ajouter_patient(5153246426901, 'Britni', 'Lanfer', '1953-08-31', 'A', 2546389123, NULL, 'blanfer3n@tmall.com', 40);
select ajouter_patient(6190362773751, 'Kipper', 'Evequot', '1949-08-06', 'F', 1315432275, NULL, 'kevequot3o@cnn.com', 62);
select ajouter_patient(8206788776202, 'Sid', 'Clines', '1947-08-10', 'A', 2362068794, NULL, 'sclines3p@sogou.com', 76);
select ajouter_patient(3631865395015, 'Rolland', 'Alejandre', '1924-09-06', 'A', 8704984343, NULL, 'ralejandre3q@chronoengine.com', 74);
select ajouter_patient(2448526047409, 'Ranice', 'Swynley', '1964-08-26', 'F', 3671533474, NULL, 'rswynley3r@hugedomains.com', 54);
select ajouter_patient(2340571034060, 'Cathee', 'Kilbee', '2010-09-04', 'A', 4096011113, NULL, 'ckilbee3s@guardian.co.uk', 16);
select ajouter_patient(6172796386435, 'Lucila', 'Cloney', '1930-11-10', 'H', 9150835564, NULL, 'lcloney3t@dell.com', 89);
select ajouter_patient(8203723211663, 'Mattie', 'Hawksby', '1968-01-24', 'F', 6717105131, NULL, 'mhawksby3u@google.ca', 58);
select ajouter_patient(676999299146, 'Daffi', 'Jzhakov', '1960-08-05', 'H', 6632643040, NULL, 'djzhakov3v@prlog.org', 93);
select ajouter_patient(8434221902838, 'Berny', 'Dosdale', '1943-08-08', 'A', 8536014485, NULL, 'bdosdale3w@icq.com', 58);
select ajouter_patient(9624998569372, 'Linnie', 'Entwisle', '1970-02-20', 'F', 4304770349, NULL, 'lentwisle3x@adobe.com', 29);
select ajouter_patient(4662025850066, 'Giralda', 'Spensly', '1988-08-29', 'F', 3626363334, NULL, 'gspensly3y@mysql.com', 63);
select ajouter_patient(2416488297274, 'Rosanne', 'Stinchcombe', '1977-07-11', 'A', 4094734579, NULL, 'rstinchcombe3z@wired.com', 89);
select ajouter_patient(7561855323439, 'Linoel', 'Keates', '1998-01-11', 'H', 997864876, NULL, 'lkeates40@opera.com', 36);
select ajouter_patient(8097384360402, 'Lissie', 'Hayfield', '1932-11-19', 'A', 9722619650, NULL, 'lhayfield41@parallels.com', 50);
select ajouter_patient(5832689449305, 'Westbrook', 'Vinter', '2013-09-15', 'A', 8737217664, NULL, 'wvinter42@columbia.edu', 33);
select ajouter_patient(80113865227, 'Rodi', 'Landal', '1996-10-18', 'A', 870017031, NULL, 'rlandal43@yellowbook.com', 95);
select ajouter_patient(8620251640298, 'Veronica', 'Kanzler', '1998-03-24', 'A', 1358147880, NULL, 'vkanzler44@soup.io', 70);
select ajouter_patient(637115427041, 'Molli', 'Christie', '1981-06-26', 'A', 5675716346, NULL, 'mchristie45@spotify.com', 71);
select ajouter_patient(4051990853532, 'Velma', 'Jelf', '1971-06-17', 'H', 3127447047, NULL, 'vjelf46@admin.ch', 65);
select ajouter_patient(5118822145867, 'Persis', 'Sterricker', '1987-03-23', 'H', 6012492910, NULL, 'psterricker47@technorati.com', 30);
select ajouter_patient(7627221741913, 'Jere', 'Findley', '2015-12-12', 'F', 409514975, NULL, 'jfindley48@hostgator.com', 13);
select ajouter_patient(7222573310551, 'Emeline', 'Semper', '1941-01-05', 'A', 994457075, NULL, 'esemper49@techcrunch.com', 3);
select ajouter_patient(2660331453966, 'Chantal', 'Calderon', '1936-05-08', 'A', 1145468299, NULL, 'ccalderon4a@google.com.au', 94);
select ajouter_patient(2762391051475, 'Estrellita', 'Orvis', '1995-10-15', 'H', 6535090987, NULL, 'eorvis4b@posterous.com', 6);
select ajouter_patient(1149004262775, 'Ginnie', 'Hencke', '1953-03-22', 'A', 519982320, NULL, 'ghencke4c@sogou.com', 22);
select ajouter_patient(643106527279, 'Angus', 'Cavey', '2019-03-29', 'H', 3826981398, NULL, 'acavey4d@acquirethisname.com', 69);
select ajouter_patient(9593711542865, 'Georas', 'Dreakin', '1994-06-30', 'H', 3632529505, NULL, 'gdreakin4e@sogou.com', 31);
select ajouter_patient(7537972447230, 'Heddie', 'Wilshire', '1968-05-26', 'H', 3377482923, NULL, 'hwilshire4f@geocities.com', 81);
select ajouter_patient(2868695123192, 'Lucien', 'Woolner', '1940-01-11', 'A', 7676123100, NULL, 'lwoolner4g@storify.com', 85);
select ajouter_patient(4376693067166, 'Andy', 'Chinery', '1967-10-15', 'H', 5639865921, NULL, 'achinery4h@blog.com', 48);
select ajouter_patient(8409909429068, 'Jecho', 'Ellingsworth', '1954-03-09', 'A', 768623070, NULL, 'jellingsworth4i@surveymonkey.com', 68);
select ajouter_patient(7392687265808, 'Gerhard', 'MacConnal', '1972-03-24', 'F', 2130371781, NULL, 'gmacconnal4j@sogou.com', 85);
select ajouter_patient(9351491096396, 'Dore', 'Dmitrovic', '1920-07-11', 'A', 6385442241, NULL, 'ddmitrovic4k@e-recht24.de', 78);
select ajouter_patient(357459829437, 'Dreddy', 'Mandal', '2009-12-01', 'A', 5228047087, NULL, 'dmandal4l@yahoo.com', 53);
select ajouter_patient(2095131134093, 'Tiebold', 'Devin', '1981-06-29', 'A', 3675536028, NULL, 'tdevin4m@whitehouse.gov', 54);
select ajouter_patient(2947234551326, 'Jaquelyn', 'Mattiello', '1986-09-05', 'A', 2918469956, NULL, 'jmattiello4n@shinystat.com', 12);
select ajouter_patient(4198524398621, 'Christian', 'Hamstead', '1936-07-14', 'H', 5300484530, NULL, 'chamstead4o@dmoz.org', 64);
select ajouter_patient(8558503857630, 'Juana', 'Knoble', '1987-08-04', 'A', 9680556824, NULL, 'jknoble4p@rakuten.co.jp', 35);
select ajouter_patient(8757527847213, 'Deanne', 'Tye', '1933-04-29', 'F', 9981714530, NULL, 'dtye4q@wikispaces.com', 28);
select ajouter_patient(2438218927337, 'Gloria', 'MacTrustram', '1957-10-28', 'F', 6403293995, NULL, 'gmactrustram4r@marketwatch.com', 27);
select ajouter_patient(7446053475884, 'Wandis', 'Bute', '1941-08-07', 'A', 6248885481, NULL, 'wbute4s@issuu.com', 48);
select ajouter_patient(4376575539777, 'Devin', 'Devil', '1986-10-24', 'H', 9559205539, NULL, 'ddevil4t@delicious.com', 16);
select ajouter_patient(926950539507, 'Tanitansy', 'Wiper', '1995-06-17', 'A', 723829885, NULL, 'twiper4u@fc2.com', 10);
select ajouter_patient(2303513837724, 'Brandise', 'Wyburn', '1925-05-21', 'F', 2396157707, NULL, 'bwyburn4v@privacy.gov.au', 36);
select ajouter_patient(3492638485139, 'Kerry', 'Rampage', '1957-08-24', 'A', 9311890943, NULL, 'krampage4w@bloomberg.com', 30);
select ajouter_patient(9985326697597, 'Rosalynd', 'Lindenblatt', '1927-01-18', 'H', 8215782832, NULL, 'rlindenblatt4x@usda.gov', 95);
select ajouter_patient(5448267660769, 'Marthe', 'Richardson', '1994-01-04', 'H', 4735788398, NULL, 'mrichardson4y@list-manage.com', 69);
select ajouter_patient(7934817012389, 'Nisse', 'Domotor', '1967-02-09', 'H', 1172429849, NULL, 'ndomotor4z@theglobeandmail.com', 80);
select ajouter_patient(2134965664462, 'Lyndel', 'Tonry', '2012-12-12', 'H', 5963010855, NULL, 'ltonry50@cyberchimps.com', 53);
select ajouter_patient(8037640928255, 'Anissa', 'Guswell', '2006-02-24', 'A', 4528114523, NULL, 'aguswell51@toplist.cz', 23);
select ajouter_patient(8242754449418, 'Flor', 'Sugar', '1947-06-19', 'F', 4584733687, NULL, 'fsugar52@mayoclinic.com', 44);
select ajouter_patient(899441121056, 'Upton', 'Cordeix', '1923-04-07', 'H', 4310270281, NULL, 'ucordeix53@bravesites.com', 35);
select ajouter_patient(7755695837688, 'Aldridge', 'Van T''Hoog', '1987-05-09', 'A', 7640688797, NULL, 'avanthoog54@timesonline.co.uk', 47);
select ajouter_patient(2470715067704, 'Aubrey', 'Cubbon', '2007-09-19', 'H', 1381325764, NULL, 'acubbon55@blog.com', 41);
select ajouter_patient(6120081766895, 'Valery', 'Tabert', '1954-08-05', 'A', 8450464525, NULL, 'vtabert56@t.co', 53);
select ajouter_patient(1327276828634, 'Elysia', 'Spaughton', '1976-10-27', 'A', 3993948681, NULL, 'espaughton57@va.gov', 61);
select ajouter_patient(9043075348909, 'Bruce', 'Tobias', '1950-02-06', 'H', 5327184567, NULL, 'btobias58@pagesperso-orange.fr', 77);
select ajouter_patient(344719861308, 'Marybeth', 'Muselli', '1976-06-17', 'H', 282267782, NULL, 'mmuselli59@addtoany.com', 69);
select ajouter_patient(262693160208, 'Brucie', 'Hairsine', '1988-07-22', 'A', 1107967934, NULL, 'bhairsine5a@friendfeed.com', 29);
select ajouter_patient(2045631574779, 'Bendicty', 'Ricciardi', '2007-01-31', 'H', 1405588077, NULL, 'bricciardi5b@ameblo.jp', 25);
select ajouter_patient(431148710197, 'Addy', 'Digginson', '1992-07-29', 'F', 9078133962, NULL, 'adigginson5c@nasa.gov', 5);
select ajouter_patient(6440358145971, 'Aleta', 'Preto', '2005-09-10', 'A', 1745474738, NULL, 'apreto5d@tinypic.com', 21);
select ajouter_patient(3203345553950, 'Itch', 'Withrington', '1984-06-22', 'A', 3468931025, NULL, 'iwithrington5e@liveinternet.ru', 20);
select ajouter_patient(9788247800810, 'Arley', 'Toll', '1958-05-01', 'A', 2727728031, NULL, 'atoll5f@sfgate.com', 24);
select ajouter_patient(5997715352392, 'Rica', 'Jilkes', '1973-06-29', 'A', 8589663178, NULL, 'rjilkes5g@paginegialle.it', 79);
select ajouter_patient(7954092570258, 'Filmore', 'Lesper', '2015-06-29', 'A', 5763727616, NULL, 'flesper5h@jugem.jp', 3);
select ajouter_patient(4845509273902, 'Kordula', 'Orrobin', '1984-12-06', 'F', 8449432099, NULL, 'korrobin5i@oaic.gov.au', 88);
select ajouter_patient(7059523973103, 'Walliw', 'Vogel', '1995-09-19', 'H', 9157444073, NULL, 'wvogel5j@hp.com', 20);
select ajouter_patient(8059191677190, 'Ed', 'Cready', '2016-06-01', 'A', 33827707, NULL, 'ecready5k@cafepress.com', 94);
select ajouter_patient(2558574477624, 'Dian', 'Spaule', '1927-05-06', 'H', 2979928526, NULL, 'dspaule5l@google.fr', 70);
select ajouter_patient(6194794908061, 'Findley', 'Gavrielly', '1982-02-24', 'F', 6827096007, NULL, 'fgavrielly5m@weibo.com', 26);
select ajouter_patient(4499002654031, 'Barbra', 'Peterken', '1990-01-09', 'A', 4063001128, NULL, 'bpeterken5n@ycombinator.com', 16);
select ajouter_patient(356664833086, 'Marylee', 'Loadsman', '1973-03-12', 'A', 5449585648, NULL, 'mloadsman5o@usa.gov', 11);
select ajouter_patient(2574167629906, 'Kizzee', 'Scarff', '2003-12-03', 'H', 6109956159, NULL, 'kscarff5p@hibu.com', 29);
select ajouter_patient(5649608401827, 'Jewelle', 'Franz-Schoninger', '1992-02-25', 'H', 2267131029, NULL, 'jfranzschoninger5q@zdnet.com', 93);
select ajouter_patient(4704706384184, 'Gaby', 'Mulcahy', '1962-11-01', 'H', 9052962282, NULL, 'gmulcahy5r@microsoft.com', 48);
select ajouter_patient(5341565855917, 'Stevana', 'Waiting', '2016-05-14', 'F', 6182769108, NULL, 'swaiting5s@independent.co.uk', 80);
select ajouter_patient(5053853400289, 'Lani', 'Learmond', '2011-10-24', 'H', 9173564920, NULL, 'llearmond5t@ucoz.com', 66);
select ajouter_patient(1347780479848, 'Dar', 'Poynter', '1953-01-08', 'A', 7747071947, NULL, 'dpoynter5u@princeton.edu', 58);
select ajouter_patient(5772583194948, 'Malvin', 'Rusted', '1960-09-06', 'H', 8687121463, NULL, 'mrusted5v@github.io', 32);
select ajouter_patient(4528334112315, 'Sid', 'Seeman', '1978-04-10', 'A', 1839995436, NULL, 'sseeman5w@cocolog-nifty.com', 92);
select ajouter_patient(4687753550015, 'Christian', 'Weavers', '1954-02-15', 'H', 7851525554, NULL, 'cweavers5x@cargocollective.com', 50);
select ajouter_patient(7704735908090, 'Sashenka', 'Scougal', '1949-02-02', 'H', 648530479, NULL, 'sscougal5y@senate.gov', 73);
select ajouter_patient(1736262238200, 'Brook', 'Dudson', '1925-04-01', 'A', 8638097018, NULL, 'bdudson5z@narod.ru', 89);
select ajouter_patient(5914478600893, 'Chad', 'Olivella', '1979-07-11', 'F', 5688376980, NULL, 'colivella60@surveymonkey.com', 90);
select ajouter_patient(3573585804923, 'Tabby', 'Aslam', '1996-06-06', 'H', 9389509290, NULL, 'taslam61@yelp.com', 87);
select ajouter_patient(2042382586056, 'Gerianna', 'Sandys', '1996-05-01', 'H', 547840099, NULL, 'gsandys62@amazon.co.jp', 1);
select ajouter_patient(6193643011743, 'Teodoro', 'Springham', '1944-05-22', 'F', 1127848147, NULL, 'tspringham63@gmpg.org', 8);
select ajouter_patient(4774599884154, 'Alyssa', 'Asey', '1949-08-20', 'H', 471384593, NULL, 'aasey64@multiply.com', 24);
select ajouter_patient(6116583375446, 'Sashenka', 'Prahm', '2006-08-09', 'A', 4216780105, NULL, 'sprahm65@umich.edu', 89);
select ajouter_patient(3168498516103, 'Andee', 'Sugarman', '1920-08-11', 'F', 3591401405, NULL, 'asugarman66@howstuffworks.com', 13);
select ajouter_patient(6064941090278, 'Saree', 'Tuison', '1985-05-01', 'F', 2131310744, NULL, 'stuison67@histats.com', 70);
select ajouter_patient(1365372150473, 'Alfi', 'Petett', '1950-05-05', 'F', 6917309633, NULL, 'apetett68@angelfire.com', 41);
select ajouter_patient(5209581720182, 'Valida', 'Van de Castele', '1968-10-27', 'A', 4617563023, NULL, 'vvandecastele69@ucoz.ru', 85);
select ajouter_patient(5364703868519, 'Kaleena', 'Worsfield', '1968-12-21', 'H', 4558054465, NULL, 'kworsfield6a@upenn.edu', 57);
select ajouter_patient(9269596410319, 'Zarah', 'Naper', '1938-04-09', 'F', 4827889801, NULL, 'znaper6b@tripadvisor.com', 42);
select ajouter_patient(2624196968405, 'Georges', 'Birmingham', '2015-02-03', 'A', 4014593948, NULL, 'gbirmingham6c@moonfruit.com', 6);
select ajouter_patient(3775044997256, 'Star', 'Annatt', '1937-02-02', 'F', 6930622214, NULL, 'sannatt6d@tmall.com', 14);
select ajouter_patient(6307356970095, 'Jami', 'Martill', '1982-09-05', 'A', 9565714661, NULL, 'jmartill6e@oakley.com', 87);
select ajouter_patient(9530254545318, 'Klarrisa', 'Batting', '2011-05-18', 'H', 945216082, NULL, 'kbatting6f@si.edu', 43);
select ajouter_patient(5390674648337, 'Carce', 'Muggeridge', '1939-04-05', 'H', 8043735329, NULL, 'cmuggeridge6g@harvard.edu', 38);
select ajouter_patient(6883904026991, 'Geoff', 'Woollin', '2011-05-19', 'A', 8373241463, NULL, 'gwoollin6h@pinterest.com', 80);
select ajouter_patient(5401644248391, 'Killie', 'Rouf', '1936-01-19', 'A', 3343587542, NULL, 'krouf6i@netlog.com', 94);
select ajouter_patient(1627438348338, 'Wyn', 'Ducarel', '1927-06-13', 'F', 1472278778, NULL, 'wducarel6j@nytimes.com', 63);
select ajouter_patient(6526670378240, 'Juli', 'Cattroll', '1995-11-12', 'H', 6129501578, NULL, 'jcattroll6k@google.ru', 87);
select ajouter_patient(7759604672864, 'Lorant', 'Jessel', '1924-04-07', 'H', 9178088073, NULL, 'ljessel6l@hubpages.com', 53);
select ajouter_patient(2304305915089, 'Catherin', 'Sorbie', '1927-04-23', 'A', 6180658475, NULL, 'csorbie6m@phpbb.com', 30);
select ajouter_patient(2906126165596, 'Gil', 'Klesse', '1978-10-16', 'H', 5927698059, NULL, 'gklesse6n@wiley.com', 58);
select ajouter_patient(8815203190279, 'Shermy', 'Chark', '1959-12-31', 'H', 7540275307, NULL, 'schark6o@amazon.de', 81);
select ajouter_patient(7993315740906, 'Josie', 'Rhodus', '1983-10-22', 'A', 2751299521, NULL, 'jrhodus6p@w3.org', 92);
select ajouter_patient(4471793268909, 'Perren', 'Burnapp', '1981-08-27', 'A', 3301232098, NULL, 'pburnapp6q@ebay.co.uk', 95);
select ajouter_patient(8506355313998, 'Stanleigh', 'Faye', '1926-06-03', 'A', 1556538548, NULL, 'sfaye6r@china.com.cn', 9);
select ajouter_patient(3493664208665, 'Sherill', 'Gamil', '1942-12-26', 'A', 4643528649, NULL, 'sgamil6s@tinyurl.com', 81);
select ajouter_patient(8829128164351, 'Benedetto', 'Garrold', '1978-04-19', 'A', 3045197802, NULL, 'bgarrold6t@hugedomains.com', 95);
select ajouter_patient(7980969516731, 'Eada', 'Dioniso', '1973-12-09', 'A', 1181267408, NULL, 'edioniso6u@gizmodo.com', 54);
select ajouter_patient(5338791174272, 'Heida', 'Chasen', '1942-10-28', 'F', 2656816254, NULL, 'hchasen6v@de.vu', 66);
select ajouter_patient(9379313819848, 'Frannie', 'Keigher', '2001-01-16', 'F', 4444312189, NULL, 'fkeigher6w@bbc.co.uk', 55);
select ajouter_patient(558253616826, 'Raffarty', 'Joutapaitis', '1988-11-14', 'A', 1499118188, NULL, 'rjoutapaitis6x@360.cn', 71);
select ajouter_patient(3820746059160, 'Kriste', 'Dakhov', '1933-08-08', 'F', 2352599, NULL, 'kdakhov6y@sakura.ne.jp', 3);
select ajouter_patient(8613054121744, 'Rockie', 'Kubik', '1998-01-09', 'A', 8591045384, NULL, 'rkubik6z@chronoengine.com', 94);
select ajouter_patient(5718952375424, 'Ainslie', 'Gunner', '1934-08-17', 'A', 3982741267, NULL, 'agunner70@i2i.jp', 54);
select ajouter_patient(1919713025195, 'Maynard', 'Richardson', '1970-07-27', 'F', 6821623841, NULL, 'mrichardson71@godaddy.com', 40);
select ajouter_patient(4085754184171, 'Wilbur', 'Siegertsz', '2002-01-10', 'A', 9768049142, NULL, 'wsiegertsz72@geocities.jp', 63);
select ajouter_patient(7572720917878, 'Reade', 'Roubert', '1970-07-17', 'A', 677189888, NULL, 'rroubert73@va.gov', 18);
select ajouter_patient(8910639056231, 'Edmon', 'Candelin', '2000-07-27', 'H', 3026672336, NULL, 'ecandelin74@yolasite.com', 33);
select ajouter_patient(5088857327834, 'Neale', 'Pashen', '1972-09-13', 'A', 591555298, NULL, 'npashen75@merriam-webster.com', 44);
select ajouter_patient(6684765354823, 'Iosep', 'Gadney', '1924-11-22', 'F', 1714534778, NULL, 'igadney76@howstuffworks.com', 74);
select ajouter_patient(8328486287463, 'Drusilla', 'Allward', '2000-06-13', 'H', 1259072875, NULL, 'dallward77@seattletimes.com', 8);
select ajouter_patient(6057100006432, 'Fanchette', 'Conti', '2018-07-26', 'A', 5202561277, NULL, 'fconti78@homestead.com', 16);
select ajouter_patient(3850171166062, 'Eli', 'Dixsee', '1945-03-28', 'A', 3357101454, NULL, 'edixsee79@elegantthemes.com', 36);
select ajouter_patient(558605945036, 'Wyndham', 'Rush', '1945-09-03', 'A', 58395608, NULL, 'wrush7a@blogspot.com', 47);
select ajouter_patient(1013196513037, 'Brittni', 'Barnewelle', '1977-01-23', 'A', 6327565167, NULL, 'bbarnewelle7b@g.co', 94);
select ajouter_patient(7120897815709, 'Alanah', 'Wolters', '1920-05-27', 'F', 2553521018, NULL, 'awolters7c@google.com.hk', 38);
select ajouter_patient(8702108328555, 'Ahmad', 'Cartmill', '1956-12-16', 'H', 4309498433, NULL, 'acartmill7d@house.gov', 76);
select ajouter_patient(7514960479850, 'Cora', 'Tybalt', '1942-12-17', 'A', 59231471, NULL, 'ctybalt7e@usgs.gov', 68);
select ajouter_patient(9002690709383, 'Boigie', 'Bingell', '2011-08-01', 'H', 8330880468, NULL, 'bbingell7f@washington.edu', 25);
select ajouter_patient(3664874767795, 'Celestia', 'Message', '1988-01-15', 'A', 7729402447, NULL, 'cmessage7g@oracle.com', 62);
select ajouter_patient(1140928749675, 'Kain', 'Lecointe', '1993-09-25', 'H', 3024463986, NULL, 'klecointe7h@yandex.ru', 90);
select ajouter_patient(414687727871, 'Ellene', 'Sagg', '2002-10-27', 'F', 1417944365, NULL, 'esagg7i@purevolume.com', 59);
select ajouter_patient(3176502556346, 'Hermia', 'Reedman', '2017-05-29', 'H', 5054653079, NULL, 'hreedman7j@freewebs.com', 67);
select ajouter_patient(2302045539608, 'Ginnie', 'Fishburn', '1930-05-15', 'A', 8475955953, NULL, 'gfishburn7k@europa.eu', 5);
select ajouter_patient(6733559296198, 'Ewell', 'Mawby', '1932-06-09', 'F', 6824668646, NULL, 'emawby7l@nydailynews.com', 57);
select ajouter_patient(8452944917742, 'Bessie', 'Dunphy', '2006-05-03', 'F', 5813646327, NULL, 'bdunphy7m@amazon.co.uk', 58);
select ajouter_patient(3026521018235, 'Guillema', 'Aylesbury', '1932-09-15', 'A', 7348755369, NULL, 'gaylesbury7n@theatlantic.com', 34);
select ajouter_patient(6648928634234, 'Berty', 'Jeacop', '1981-01-04', 'H', 4617936416, NULL, 'bjeacop7o@craigslist.org', 90);
select ajouter_patient(5258349677552, 'Horatia', 'Crosby', '1964-06-23', 'F', 464172904, NULL, 'hcrosby7p@vimeo.com', 41);
select ajouter_patient(6535621082527, 'Moll', 'GiacobbiniJacob', '1996-08-09', 'A', 6671527084, NULL, 'mgiacobbinijacob7q@about.com', 25);
select ajouter_patient(1913700755716, 'Leann', 'Iwanicki', '2002-07-08', 'F', 6885922062, NULL, 'liwanicki7r@mlb.com', 32);
select ajouter_patient(5235906964995, 'Bren', 'Philippet', '1948-11-27', 'H', 324913715, NULL, 'bphilippet7s@exblog.jp', 32);
select ajouter_patient(1535166734057, 'Glenda', 'MacCulloch', '1924-02-07', 'F', 2175872584, NULL, 'gmacculloch7t@huffingtonpost.com', 80);
select ajouter_patient(5219127786234, 'Trish', 'Devorill', '1927-08-13', 'A', 9871554535, NULL, 'tdevorill7u@51.la', 70);
select ajouter_patient(478377520715, 'Merissa', 'Nowak', '1942-03-13', 'F', 228398116, NULL, 'mnowak7v@over-blog.com', 15);
select ajouter_patient(8238844670107, 'Ricca', 'Yushachkov', '1923-09-08', 'F', 855209769, NULL, 'ryushachkov7w@theguardian.com', 28);
select ajouter_patient(5686144328343, 'Garwood', 'Murney', '1930-05-27', 'F', 7649582867, NULL, 'gmurney7x@marketwatch.com', 60);
select ajouter_patient(6355570018100, 'Mariellen', 'Pedden', '1950-04-07', 'A', 5196075148, NULL, 'mpedden7y@nationalgeographic.com', 70);
select ajouter_patient(500557845480, 'Fields', 'Sidsaff', '1927-04-12', 'A', 8943686839, NULL, 'fsidsaff7z@typepad.com', 5);
select ajouter_patient(2512628858841, 'Cassie', 'Anthonies', '1930-09-11', 'F', 4272512400, NULL, 'canthonies80@virginia.edu', 85);
select ajouter_patient(7049078796358, 'Ivette', 'Todman', '1979-05-15', 'H', 4057106990, NULL, 'itodman81@cbslocal.com', 57);
select ajouter_patient(1818968599191, 'Sergio', 'Friel', '2002-02-07', 'A', 2007642466, NULL, 'sfriel82@cam.ac.uk', 18);
select ajouter_patient(6723544974630, 'Dag', 'Rosenbush', '1958-08-02', 'H', 7463213081, NULL, 'drosenbush83@china.com.cn', 1);
select ajouter_patient(1537746681628, 'Harland', 'Nisbet', '1948-10-17', 'H', 1042426620, NULL, 'hnisbet84@java.com', 71);
select ajouter_patient(2346358285402, 'Averil', 'Boagey', '1978-09-04', 'F', 6872486798, NULL, 'aboagey85@mtv.com', 81);
select ajouter_patient(4771543477971, 'Gorden', 'Yeliashev', '2016-03-19', 'A', 3096806413, NULL, 'gyeliashev86@ebay.co.uk', 71);
select ajouter_patient(6512696402103, 'Xylia', 'Beardshaw', '1920-05-04', 'H', 8387508317, NULL, 'xbeardshaw87@bandcamp.com', 34);
select ajouter_patient(5682670733086, 'Mozelle', 'Thorwarth', '1970-03-19', 'A', 1615932144, NULL, 'mthorwarth88@biglobe.ne.jp', 91);
select ajouter_patient(1121628991034, 'Bailie', 'Claypole', '2019-06-10', 'A', 5079269090, NULL, 'bclaypole89@goo.gl', 90);
select ajouter_patient(3449724248706, 'Larine', 'Deyes', '1987-08-12', 'H', 9794016839, NULL, 'ldeyes8a@nbcnews.com', 19);
select ajouter_patient(1193005268256, 'Yoko', 'Westley', '1983-10-07', 'F', 7356035685, NULL, 'ywestley8b@wsj.com', 34);
select ajouter_patient(6724053876516, 'Hattie', 'Dibson', '1951-12-07', 'H', 5258194953, NULL, 'hdibson8c@aboutads.info', 50);
select ajouter_patient(6549247493333, 'Jason', 'Alvarez', '1955-01-27', 'F', 6680328864, NULL, 'jalvarez8d@timesonline.co.uk', 47);
select ajouter_patient(9422396697543, 'Nessie', 'Bartke', '1949-12-13', 'F', 14573758, NULL, 'nbartke8e@blogspot.com', 62);
select ajouter_patient(2960272265117, 'Lynelle', 'Dagwell', '1946-05-04', 'A', 6227114207, NULL, 'ldagwell8f@printfriendly.com', 93);
select ajouter_patient(7426885641601, 'Garey', 'Dinjes', '1972-07-07', 'A', 302181464, NULL, 'gdinjes8g@goo.ne.jp', 5);
select ajouter_patient(3462936948126, 'Terry', 'Terrell', '1935-10-20', 'H', 5128372992, NULL, 'tterrell8h@weather.com', 79);
select ajouter_patient(8562177524439, 'Amaleta', 'Iacobassi', '2013-02-21', 'H', 6079928217, NULL, 'aiacobassi8i@parallels.com', 45);
select ajouter_patient(47001140086, 'Zechariah', 'Driuzzi', '2000-01-04', 'H', 7557328866, NULL, 'zdriuzzi8j@xing.com', 82);
select ajouter_patient(7039368303770, 'Buddie', 'Granville', '2002-09-25', 'H', 6827407418, NULL, 'bgranville8k@samsung.com', 43);
select ajouter_patient(830399458476, 'Vere', 'Karpychev', '1972-10-06', 'A', 6705313279, NULL, 'vkarpychev8l@salon.com', 61);
select ajouter_patient(7567649266346, 'Dorian', 'Greenland', '1975-05-23', 'F', 1538399707, NULL, 'dgreenland8m@so-net.ne.jp', 23);
select ajouter_patient(3251087653803, 'Sophi', 'Cords', '1952-09-20', 'A', 3273479711, NULL, 'scords8n@google.ca', 4);
select ajouter_patient(5887166047550, 'Iorgo', 'Sherwyn', '1959-10-31', 'F', 5655692170, NULL, 'isherwyn8o@microsoft.com', 88);
select ajouter_patient(4551111832055, 'Cammy', 'Overal', '1954-08-28', 'A', 905831818, NULL, 'coveral8p@gravatar.com', 86);
select ajouter_patient(1111708235017, 'Fulton', 'Acarson', '1933-06-02', 'A', 852666317, NULL, 'facarson8q@sogou.com', 59);
select ajouter_patient(170024758189, 'Aime', 'Davidowsky', '1976-12-17', 'F', 8732008981, NULL, 'adavidowsky8r@people.com.cn', 14);
select ajouter_patient(7247474123614, 'Claudia', 'Dosdill', '2009-05-05', 'A', 1646552687, NULL, 'cdosdill8s@cargocollective.com', 80);
select ajouter_patient(7982145855510, 'Louise', 'Lythgoe', '1969-05-21', 'A', 9401571772, NULL, 'llythgoe8t@bigcartel.com', 36);
select ajouter_patient(5012704931670, 'Dill', 'Rey', '1997-11-28', 'H', 9885840811, NULL, 'drey8u@yahoo.co.jp', 40);
select ajouter_patient(9713469099334, 'Herculie', 'Cody', '1981-08-18', 'A', 3004477825, NULL, 'hcody8v@cyberchimps.com', 85);
select ajouter_patient(6483156347082, 'Petronella', 'Cuddihy', '1930-01-04', 'A', 72791436, NULL, 'pcuddihy8w@businessweek.com', 79);
select ajouter_patient(9640351467320, 'Monah', 'Moffet', '1961-06-03', 'F', 1042564561, NULL, 'mmoffet8x@ehow.com', 41);
select ajouter_patient(3120472275542, 'Gunter', 'Greg', '1965-04-10', 'A', 9757854963, NULL, 'ggreg8y@jiathis.com', 25);
select ajouter_patient(9715647181265, 'Irina', 'Sillars', '1933-06-11', 'A', 590071783, NULL, 'isillars8z@sphinn.com', 48);
select ajouter_patient(1872198981178, 'Maxi', 'Shears', '2001-02-23', 'A', 8030868249, NULL, 'mshears90@istockphoto.com', 72);
select ajouter_patient(426709087226, 'Donn', 'Bispham', '2014-04-19', 'F', 8338318630, NULL, 'dbispham91@japanpost.jp', 13);
select ajouter_patient(8190377453723, 'Ernesto', 'O''Fairy', '1944-04-16', 'H', 845851147, NULL, 'eofairy92@privacy.gov.au', 69);
select ajouter_patient(2281322829789, 'Cornie', 'Ledgley', '1955-02-02', 'A', 3371939632, NULL, 'cledgley93@moonfruit.com', 18);
select ajouter_patient(9210877612718, 'Burl', 'Carnachen', '1968-10-28', 'F', 4176959854, NULL, 'bcarnachen94@hc360.com', 50);
select ajouter_patient(4597175381396, 'Bancroft', 'Augustus', '1925-03-24', 'F', 2377355529, NULL, 'baugustus95@hatena.ne.jp', 5);
select ajouter_patient(3865788520852, 'Leeanne', 'Whitnell', '2017-08-01', 'A', 3886885886, NULL, 'lwhitnell96@amazon.co.jp', 86);
select ajouter_patient(6627707469092, 'Enrico', 'Grissett', '1937-11-12', 'A', 1639427677, NULL, 'egrissett97@harvard.edu', 63);
select ajouter_patient(817058983416, 'Constantin', 'Dunderdale', '1980-08-20', 'A', 4549185194, NULL, 'cdunderdale98@blogtalkradio.com', 93);
select ajouter_patient(8414481174843, 'Michele', 'Stonhewer', '1920-05-09', 'A', 7486826650, NULL, 'mstonhewer99@icq.com', 2);
select ajouter_patient(3849929445327, 'Layney', 'Bursnell', '1992-06-13', 'A', 666424540, NULL, 'lbursnell9a@blogs.com', 38);
select ajouter_patient(2925545289772, 'Brant', 'Rowan', '1928-09-26', 'A', 4013412185, NULL, 'browan9b@woothemes.com', 74);
select ajouter_patient(9644670914562, 'Danila', 'Rayworth', '1925-08-06', 'A', 5235697407, NULL, 'drayworth9c@google.cn', 46);
select ajouter_patient(6819375659161, 'Jerrie', 'Rolfini', '1933-02-25', 'H', 475351565, NULL, 'jrolfini9d@techcrunch.com', 95);
select ajouter_patient(6100502876357, 'Rochette', 'Espinola', '1949-04-12', 'A', 7748626663, NULL, 'respinola9e@stumbleupon.com', 33);
select ajouter_patient(354928150608, 'Haywood', 'Cortez', '1958-03-31', 'H', 8472119731, NULL, 'hcortez9f@elegantthemes.com', 63);
select ajouter_patient(1686607446696, 'Merilee', 'Dwelling', '1985-11-04', 'F', 455853217, NULL, 'mdwelling9g@newyorker.com', 63);
select ajouter_patient(7014923568030, 'Faun', 'Bednell', '1932-10-13', 'F', 9140115773, NULL, 'fbednell9h@themeforest.net', 72);
select ajouter_patient(3728830132289, 'Collen', 'Zum Felde', '1941-01-12', 'A', 1454400095, NULL, 'czumfelde9i@youtube.com', 58);
select ajouter_patient(7269824575413, 'Percival', 'Guyver', '1991-02-23', 'F', 9807930177, NULL, 'pguyver9j@pinterest.com', 63);
select ajouter_patient(7911543204230, 'Erminie', 'Bruntje', '1956-03-13', 'A', 7380239249, NULL, 'ebruntje9k@ucoz.com', 72);
select ajouter_patient(3430664788726, 'Stafani', 'Maltby', '1991-10-29', 'H', 5058317824, NULL, 'smaltby9l@oakley.com', 82);
select ajouter_patient(1505849422116, 'Homerus', 'Mico', '1963-02-08', 'H', 5660153187, NULL, 'hmico9m@smh.com.au', 67);
select ajouter_patient(4075050538495, 'Dian', 'Shone', '1924-10-12', 'F', 77666714, NULL, 'dshone9n@intel.com', 85);
select ajouter_patient(6431950342715, 'Clarette', 'Cowling', '1987-03-09', 'H', 7619823036, NULL, 'ccowling9o@thetimes.co.uk', 92);
select ajouter_patient(3142799634070, 'Dorree', 'Clifft', '1966-02-05', 'A', 3142134784, NULL, 'dclifft9p@instagram.com', 47);
select ajouter_patient(1290430781881, 'Malissa', 'Starten', '2019-09-12', 'A', 8415497328, NULL, 'mstarten9q@bloglines.com', 44);
select ajouter_patient(8578262019172, 'Deonne', 'Ferretti', '1931-05-20', 'F', 511050746, NULL, 'dferretti9r@walmart.com', 44);
select ajouter_patient(1248053029516, 'Hastie', 'Tubble', '1972-05-19', 'A', 1713823334, NULL, 'htubble9s@prnewswire.com', 83);
select ajouter_patient(2329557249303, 'Greg', 'Britten', '1992-03-19', 'A', 9555961078, NULL, 'gbritten9t@odnoklassniki.ru', 79);
select ajouter_patient(4184970390726, 'Agnola', 'Skermer', '2018-10-25', 'A', 5727420481, NULL, 'askermer9u@usnews.com', 95);
select ajouter_patient(628010075446, 'Ingar', 'Bawme', '2012-07-06', 'F', 6465061311, NULL, 'ibawme9v@oracle.com', 72);
select ajouter_patient(8455256515113, 'Claudian', 'Behnecke', '1967-08-25', 'F', 8502957687, NULL, 'cbehnecke9w@ovh.net', 87);
select ajouter_patient(5287839435195, 'Sutherlan', 'Husselbee', '1977-08-30', 'A', 1649077430, NULL, 'shusselbee9x@php.net', 69);
select ajouter_patient(5121239687213, 'Bronson', 'Vinnick', '1996-01-06', 'A', 8488982580, NULL, 'bvinnick9y@bandcamp.com', 47);
select ajouter_patient(6888643815603, 'Evonne', 'Popley', '1987-05-15', 'A', 6301031952, NULL, 'epopley9z@google.com.hk', 5);
select ajouter_patient(4701603253802, 'Sandy', 'Scrimgeour', '2001-05-15', 'A', 5572625840, NULL, 'sscrimgeoura0@a8.net', 76);
select ajouter_patient(6962251052225, 'Desiree', 'McGuckin', '1933-04-19', 'F', 9406137109, NULL, 'dmcguckina1@hatena.ne.jp', 86);
select ajouter_patient(6869532690252, 'Zacharie', 'Darwent', '1951-07-27', 'A', 3137496806, NULL, 'zdarwenta2@bravesites.com', 18);
select ajouter_patient(1552884449360, 'Miof mela', 'McGilben', '1940-11-16', 'H', 244839064, NULL, 'mmcgilbena3@vk.com', 50);
select ajouter_patient(115256070245, 'Moise', 'Crimp', '1926-10-10', 'F', 3144046625, NULL, 'mcrimpa4@apple.com', 27);
select ajouter_patient(3143362992756, 'Arlyne', 'Abrahams', '1949-10-29', 'A', 2392093758, NULL, 'aabrahamsa5@marketwatch.com', 63);
select ajouter_patient(2048982653028, 'Perl', 'Krout', '1947-09-26', 'A', 7632955922, NULL, 'pkrouta6@google.com.au', 22);
select ajouter_patient(2134959590294, 'Niven', 'Novichenko', '2016-04-20', 'A', 697276709, NULL, 'nnovichenkoa7@mayoclinic.com', 3);
select ajouter_patient(6172926652885, 'Jan', 'Bravey', '2004-02-05', 'A', 6693720237, NULL, 'jbraveya8@bigcartel.com', 40);
select ajouter_patient(6289100317236, 'Tamara', 'Sabine', '1927-04-30', 'F', 3184001575, NULL, 'tsabinea9@ebay.com', 69);
select ajouter_patient(2728813501388, 'Adelle', 'Bonnar', '2018-07-19', 'A', 101840111, NULL, 'abonnaraa@geocities.jp', 6);
select ajouter_patient(8984939918281, 'Mordecai', 'Pretious', '2013-08-31', 'A', 8235910327, NULL, 'mpretiousab@nationalgeographic.com', 9);
select ajouter_patient(3945546137761, 'Seymour', 'Schwaiger', '1928-05-28', 'F', 4404378578, NULL, 'sschwaigerac@hhs.gov', 10);
select ajouter_patient(2345239174105, 'Pepi', 'Olfert', '1932-05-03', 'A', 2164257197, NULL, 'polfertad@i2i.jp', 76);
select ajouter_patient(1955683054083, 'Mahalia', 'Blandamore', '2007-12-18', 'H', 8025541850, NULL, 'mblandamoreae@cmu.edu', 94);
select ajouter_patient(9077916548239, 'Chelsy', 'Stretton', '2020-02-03', 'A', 9092416316, NULL, 'cstrettonaf@pen.io', 81);
select ajouter_patient(1910266853099, 'Steve', 'Virr', '2008-12-24', 'A', 6229230730, NULL, 'svirrag@wikimedia.org', 74);
select ajouter_patient(8982680463449, 'Ursa', 'Farnall', '1921-02-08', 'H', 1936452907, NULL, 'ufarnallah@who.int', 47);
select ajouter_patient(5970982580572, 'Elene', 'Reuben', '1990-04-15', 'A', 3385149244, NULL, 'ereubenai@google.de', 80);
select ajouter_patient(8395357630075, 'Simonette', 'McIlwrath', '1992-10-11', 'H', 9949849851, NULL, 'smcilwrathaj@sina.com.cn', 21);
select ajouter_patient(6793953152955, 'Essy', 'Tapper', '2019-10-09', 'A', 3958672845, NULL, 'etapperak@google.com.hk', 1);
select ajouter_patient(2015626658800, 'Angele', 'Dureden', '1981-12-18', 'H', 9016562569, NULL, 'aduredenal@behance.net', 29);
select ajouter_patient(4733404218863, 'Rockie', 'Downie', '1982-03-02', 'A', 8266815856, NULL, 'rdownieam@narod.ru', 27);
select ajouter_patient(5011481850839, 'Udall', 'Guymer', '1945-05-16', 'H', 998535551, NULL, 'uguymeran@usatoday.com', 15);
select ajouter_patient(4189162078062, 'Annie', 'Kreuzer', '1987-09-28', 'H', 6412196264, NULL, 'akreuzerao@google.co.uk', 65);
select ajouter_patient(110202603067, 'Ellie', 'Nary', '1963-07-08', 'A', 4402312244, NULL, 'enaryap@addthis.com', 54);
select ajouter_patient(7543966919378, 'Hendrick', 'Valentino', '1930-05-18', 'A', 7697941180, NULL, 'hvalentinoaq@feedburner.com', 11);
select ajouter_patient(8196126566451, 'Pietro', 'Bragger', '2014-02-06', 'A', 2411872656, NULL, 'pbraggerar@ted.com', 67);
select ajouter_patient(9955936075830, 'Diego', 'Skellon', '1971-05-04', 'A', 3924897504, NULL, 'dskellonas@cornell.edu', 76);
select ajouter_patient(5690281282863, 'Claiborne', 'Dobkin', '1964-02-21', 'H', 7249494060, NULL, 'cdobkinat@bbc.co.uk', 92);
select ajouter_patient(6449962819437, 'Berty', 'Trotton', '1964-05-22', 'A', 3612987248, NULL, 'btrottonau@newyorker.com', 48);
select ajouter_patient(4439576814606, 'Vaclav', 'Matkin', '1997-06-25', 'A', 341425020, NULL, 'vmatkinav@tripadvisor.com', 11);
select ajouter_patient(923403182118, 'Clemence', 'Jandel', '1970-02-06', 'F', 2768500480, NULL, 'cjandelaw@lycos.com', 24);
select ajouter_patient(4033497210112, 'Sargent', 'Domm', '1929-06-25', 'F', 3140080393, NULL, 'sdommax@xinhuanet.com', 2);
select ajouter_patient(8179545611793, 'Gina', 'Farbrother', '1944-08-26', 'A', 2984186515, NULL, 'gfarbrotheray@jugem.jp', 20);
select ajouter_patient(9596120410110, 'Frayda', 'Cutts', '2015-05-06', 'A', 1637118336, NULL, 'fcuttsaz@sciencedaily.com', 59);
select ajouter_patient(1094458321784, 'Ardith', 'Dunnett', '1933-03-19', 'F', 3550075891, NULL, 'adunnettb0@wikispaces.com', 39);
select ajouter_patient(6487525703753, 'Eziechiele', 'Dolman', '2019-07-02', 'F', 2585998560, NULL, 'edolmanb1@weibo.com', 79);
select ajouter_patient(1654871926941, 'Lindi', 'Huot', '1951-12-12', 'A', 8007466221, NULL, 'lhuotb2@mozilla.com', 9);
select ajouter_patient(5093855213699, 'Carla', 'Cheers', '1972-03-05', 'F', 3362456708, NULL, 'ccheersb3@sciencedaily.com', 57);
select ajouter_patient(7467382499473, 'Barbette', 'Kielt', '2015-06-07', 'F', 8260267459, NULL, 'bkieltb4@aboutads.info', 54);
select ajouter_patient(9128977898319, 'Janeen', 'Pink', '1939-06-15', 'A', 2057078887, NULL, 'jpinkb5@disqus.com', 2);
select ajouter_patient(6010514773997, 'Kim', 'Vayne', '1967-12-26', 'F', 2812432270, NULL, 'kvayneb6@zdnet.com', 16);
select ajouter_patient(588221549297, 'Don', 'Nelthorpe', '1978-01-13', 'H', 2813547759, NULL, 'dnelthorpeb7@behance.net', 68);
select ajouter_patient(2249576553615, 'Rebecca', 'Stivey', '2009-12-05', 'A', 3694153970, NULL, 'rstiveyb8@un.org', 20);
select ajouter_patient(2754204099165, 'Averil', 'Bourrel', '1982-11-23', 'A', 4175012000, NULL, 'abourrelb9@google.com.br', 61);
select ajouter_patient(8657356548454, 'Lorant', 'Prujean', '1970-09-05', 'A', 498871673, NULL, 'lprujeanba@tuttocitta.it', 21);
select ajouter_patient(3137765432308, 'Fedora', 'Combe', '1949-03-15', 'A', 8572518243, NULL, 'fcombebb@sogou.com', 39);
select ajouter_patient(9723485302086, 'Ewan', 'Hamblington', '1936-02-26', 'H', 7955712726, NULL, 'ehamblingtonbc@list-manage.com', 54);
select ajouter_patient(4401602800181, 'Ingrid', 'Shord', '2002-06-05', 'A', 8168848457, NULL, 'ishordbd@mediafire.com', 92);
select ajouter_patient(9330087417241, 'Jehanna', 'Hendrikse', '1935-09-12', 'F', 7615309493, NULL, 'jhendriksebe@reuters.com', 65);
select ajouter_patient(4500340164031, 'Randall', 'Kowalski', '2000-06-11', 'A', 8157740480, NULL, 'rkowalskibf@behance.net', 36);
select ajouter_patient(9600203595563, 'Gae', 'Dumphreys', '1953-11-17', 'A', 7639778677, NULL, 'gdumphreysbg@umich.edu', 9);
select ajouter_patient(2165824710422, 'Marsha', 'Leddie', '1978-04-15', 'H', 4410658757, NULL, 'mleddiebh@about.me', 79);
select ajouter_patient(3597124825167, 'Lizzie', 'Boreham', '1972-09-02', 'A', 2374463025, NULL, 'lborehambi@facebook.com', 63);
select ajouter_patient(1979717156731, 'Devon', 'Petroff', '2004-04-07', 'A', 3662091144, NULL, 'dpetroffbj@vkontakte.ru', 65);
select ajouter_patient(8311576033099, 'Jarib', 'Cogley', '1977-09-09', 'A', 5301478130, NULL, 'jcogleybk@elpais.com', 62);
select ajouter_patient(1296392406039, 'Giuditta', 'Beynon', '1996-10-24', 'A', 3317397439, NULL, 'gbeynonbl@blogtalkradio.com', 25);
select ajouter_patient(1736919320514, 'Gilligan', 'Krout', '1998-02-15', 'A', 6337624145, NULL, 'gkroutbm@livejournal.com', 61);
select ajouter_patient(4114446683568, 'Sacha', 'Wolstenholme', '2012-10-12', 'F', 1315138783, NULL, 'swolstenholmebn@unesco.org', 55);
select ajouter_patient(2181864829049, 'Fran', 'Haydon', '2007-04-06', 'F', 420483393, NULL, 'fhaydonbo@google.es', 26);
select ajouter_patient(2924868302795, 'Humfrid', 'Cudworth', '1967-05-07', 'H', 3879748426, NULL, 'hcudworthbp@imgur.com', 66);
select ajouter_patient(1142543967915, 'Remus', 'Wethers', '1933-08-21', 'A', 3520072155, NULL, 'rwethersbq@aboutads.info', 92);
select ajouter_patient(9751869042201, 'Morna', 'Heys', '1943-04-04', 'F', 3049581492, NULL, 'mheysbr@fc2.com', 39);
select ajouter_patient(1296782597662, 'Bunni', 'Hoxey', '1963-06-15', 'A', 2033023756, NULL, 'bhoxeybs@cornell.edu', 28);
select ajouter_patient(8094836398987, 'Beck', 'Sergeaunt', '1981-12-15', 'H', 6018555241, NULL, 'bsergeauntbt@ibm.com', 14);
select ajouter_patient(402876658279, 'Fabe', 'Romaines', '1925-10-19', 'A', 1637135157, NULL, 'fromainesbu@last.fm', 27);
select ajouter_patient(9394105844048, 'Boot', 'Mildner', '1923-03-14', 'A', 1706021031, NULL, 'bmildnerbv@foxnews.com', 41);
select ajouter_patient(1406935058000, 'Duff', 'McKeveney', '1950-12-22', 'A', 9670968666, NULL, 'dmckeveneybw@jugem.jp', 62);
select ajouter_patient(2349495608667, 'Whitby', 'Leonarde', '2013-12-10', 'F', 659463403, NULL, 'wleonardebx@ebay.com', 55);
select ajouter_patient(4587163659536, 'Ofella', 'Sawfoot', '1991-03-02', 'F', 1622832401, NULL, 'osawfootby@qq.com', 78);
select ajouter_patient(4903655199227, 'Kenn', 'Skeermor', '2007-06-27', 'A', 6646655450, NULL, 'kskeermorbz@behance.net', 84);
select ajouter_patient(6306933423919, 'Alvira', 'McIlwrath', '1992-09-09', 'F', 8761914033, NULL, 'amcilwrathc0@vk.com', 74);
select ajouter_patient(1452056921045, 'Bendick', 'Wattinham', '1972-09-02', 'F', 48315092, NULL, 'bwattinhamc1@forbes.com', 58);
select ajouter_patient(1001723399288, 'Gwenora', 'Ireland', '1946-04-12', 'A', 7315805897, NULL, 'girelandc2@symantec.com', 52);
select ajouter_patient(8854103002498, 'Isadore', 'Seawright', '1943-08-06', 'A', 4245286121, NULL, 'iseawrightc3@pen.io', 75);
select ajouter_patient(1867237448565, 'Heida', 'Maydway', '2004-10-13', 'F', 8403319834, NULL, 'hmaydwayc4@goo.ne.jp', 41);
select ajouter_patient(5394372913293, 'Olva', 'McCaughren', '1935-09-25', 'A', 6964798679, NULL, 'omccaughrenc5@google.de', 26);
select ajouter_patient(8836100353140, 'Avrom', 'Quilter', '1961-02-23', 'A', 8492490370, NULL, 'aquilterc6@w3.org', 70);
select ajouter_patient(2417412991060, 'Tarra', 'Pierri', '1961-11-20', 'F', 555116036, NULL, 'tpierric7@wp.com', 76);
select ajouter_patient(7436079556213, 'Giacobo', 'Holmyard', '1995-03-18', 'A', 1577613733, NULL, 'gholmyardc8@cyberchimps.com', 85);
select ajouter_patient(5324278338363, 'Nahum', 'Rospars', '1981-06-12', 'A', 7346512792, NULL, 'nrosparsc9@technorati.com', 41);
select ajouter_patient(133149849994, 'Vyky', 'D'' Angelo', '1948-05-03', 'H', 5433819761, NULL, 'vdangeloca@istockphoto.com', 70);
select ajouter_patient(8157218320707, 'Sharai', 'Fagence', '2016-10-12', 'F', 7140782577, NULL, 'sfagencecb@newsvine.com', 36);
select ajouter_patient(551384363594, 'Lainey', 'Kalker', '1961-08-05', 'H', 2702266424, NULL, 'lkalkercc@ezinearticles.com', 53);
select ajouter_patient(5530293128360, 'Maura', 'Caldecott', '1948-10-20', 'F', 8672592635, NULL, 'mcaldecottcd@is.gd', 81);
select ajouter_patient(7466078433758, 'Gnni', 'Giaomozzo', '1944-06-24', 'H', 6105824820, NULL, 'ggiaomozzoce@gmpg.org', 77);
select ajouter_patient(6488676326847, 'Griff', 'Elcome', '1989-10-20', 'F', 4989866120, NULL, 'gelcomecf@wufoo.com', 44);
select ajouter_patient(7363510857506, 'Dianemarie', 'Velde', '1957-09-28', 'A', 3938397699, NULL, 'dveldecg@bluehost.com', 90);
select ajouter_patient(1233959538689, 'Fredrick', 'Bussy', '1970-05-01', 'F', 4399491554, NULL, 'fbussych@webeden.co.uk', 85);
select ajouter_patient(3025783588474, 'Susanetta', 'Campos', '1955-01-22', 'F', 522844967, NULL, 'scamposci@google.co.jp', 37);
select ajouter_patient(5450508030871, 'Adora', 'Cottle', '2016-12-19', 'F', 1519484265, NULL, 'acottlecj@wordpress.com', 31);
select ajouter_patient(9390388446861, 'Nicol', 'Mothersdale', '1938-08-08', 'A', 8199727843, NULL, 'nmothersdaleck@soundcloud.com', 45);
select ajouter_patient(8972285689834, 'Gale', 'Ingray', '1926-06-05', 'A', 5270466115, NULL, 'gingraycl@feedburner.com', 80);
select ajouter_patient(3306457997085, 'Hymie', 'Di Lucia', '1995-05-17', 'F', 6181618800, NULL, 'hdiluciacm@virginia.edu', 95);
select ajouter_patient(2373004711521, 'Nevsa', 'Sweatman', '2012-01-24', 'A', 6141207683, NULL, 'nsweatmancn@netvibes.com', 20);
select ajouter_patient(854484969664, 'Matt', 'Winney', '1933-07-02', 'F', 6758698960, NULL, 'mwinneyco@jalbum.net', 60);
select ajouter_patient(1678108066353, 'Joshia', 'Matelaitis', '1985-10-27', 'A', 8041969552, NULL, 'jmatelaitiscp@wp.com', 88);
select ajouter_patient(5470700176012, 'Shurwood', 'Livesey', '1964-11-09', 'F', 871738406, NULL, 'sliveseycq@people.com.cn', 70);
select ajouter_patient(590748532812, 'Jordan', 'Lansdown', '1960-09-13', 'H', 6351198884, NULL, 'jlansdowncr@baidu.com', 12);
select ajouter_patient(7316240816332, 'Imelda', 'Martill', '1968-08-15', 'A', 7930874790, NULL, 'imartillcs@who.int', 26);
select ajouter_patient(9879267214096, 'Bernadine', 'Haselup', '2007-08-23', 'H', 9442200068, NULL, 'bhaselupct@gravatar.com', 58);
select ajouter_patient(5813917414762, 'Ugo', 'Lipmann', '1960-12-26', 'F', 653351136, NULL, 'ulipmanncu@census.gov', 48);
select ajouter_patient(2202861651830, 'Vincents', 'O''Loughane', '1962-12-25', 'H', 1988522038, NULL, 'voloughanecv@tmall.com', 25);
select ajouter_patient(9835853491669, 'Brittney', 'Buffin', '1994-11-24', 'F', 1468696362, NULL, 'bbuffincw@mtv.com', 46);
select ajouter_patient(216081358747, 'Karyl', 'Knaggs', '1951-01-04', 'A', 2867443949, NULL, 'kknaggscx@ox.ac.uk', 65);
select ajouter_patient(8267330327432, 'Caryl', 'Beniesh', '1948-08-01', 'H', 4730600991, NULL, 'cbenieshcy@google.cn', 75);
select ajouter_patient(5193436194597, 'Vincent', 'Gornall', '1937-10-12', 'A', 1443606822, NULL, 'vgornallcz@buzzfeed.com', 44);
select ajouter_patient(9278759057559, 'Deck', 'World', '1958-01-27', 'A', 64426050, NULL, 'dworldd0@answers.com', 9);
select ajouter_patient(3847105498418, 'Niles', 'Tither', '1960-10-24', 'F', 8378675969, NULL, 'ntitherd1@usnews.com', 1);
select ajouter_patient(6053065389660, 'Jamal', 'Medlicott', '1936-05-26', 'A', 9837699410, NULL, 'jmedlicottd2@engadget.com', 14);
select ajouter_patient(7863144785626, 'Fredek', 'Tatchell', '1966-05-08', 'F', 4918313715, NULL, 'ftatchelld3@patch.com', 93);
select ajouter_patient(2850368291920, 'Marilin', 'Cheyne', '1922-05-08', 'F', 8084745640, NULL, 'mcheyned4@businesswire.com', 40);
select ajouter_patient(1526830868598, 'Joycelin', 'Fahey', '1939-11-07', 'A', 9863145114, NULL, 'jfaheyd5@google.fr', 30);
select ajouter_patient(8909249133859, 'Billy', 'Curley', '1978-10-26', 'H', 9937279821, NULL, 'bcurleyd6@jigsy.com', 71);
select ajouter_patient(4800334653052, 'Cinnamon', 'Martignon', '1981-02-22', 'A', 9647172024, NULL, 'cmartignond7@vistaprint.com', 19);
select ajouter_patient(245425512962, 'Benoite', 'Crehan', '2006-11-05', 'H', 5309732867, NULL, 'bcrehand8@upenn.edu', 36);
select ajouter_patient(441423870311, 'Kylynn', 'Compfort', '1971-07-05', 'A', 2089320769, NULL, 'kcompfortd9@hexun.com', 62);
select ajouter_patient(5221736342836, 'Alphonso', 'Drawmer', '1981-11-24', 'A', 8494248759, NULL, 'adrawmerda@abc.net.au', 92);
select ajouter_patient(6646107132800, 'Abbott', 'Wigfield', '2013-01-28', 'F', 24977515, NULL, 'awigfielddb@histats.com', 21);
select ajouter_patient(493206617117, 'Winona', 'Aloway', '1964-05-06', 'A', 4101518747, NULL, 'walowaydc@house.gov', 34);
select ajouter_patient(2457933832069, 'Mufi', 'Wollacott', '1933-03-02', 'F', 5217186409, NULL, 'mwollacottdd@whitehouse.gov', 17);
select ajouter_patient(1158147513533, 'Terrye', 'Kew', '1977-10-24', 'H', 7018961222, NULL, 'tkewde@reverbnation.com', 11);
select ajouter_patient(6411907326360, 'Maure', 'Trowel', '2001-04-09', 'H', 8551150155, NULL, 'mtroweldf@ca.gov', 73);
select ajouter_patient(5303866136768, 'Jolene', 'Hospital', '1955-08-23', 'H', 6900181797, NULL, 'jhospitaldg@so-net.ne.jp', 24);
select ajouter_patient(8089386819188, 'Ranna', 'Gabbitis', '1944-02-27', 'A', 3948690502, NULL, 'rgabbitisdh@google.co.uk', 84);
select ajouter_patient(9837590477248, 'Hillary', 'Krug', '1954-09-22', 'F', 1999774478, NULL, 'hkrugdi@booking.com', 11);
select ajouter_patient(8720699587803, 'Bryana', 'Keohane', '1930-06-15', 'F', 3811153725, NULL, 'bkeohanedj@xing.com', 92);
select ajouter_patient(533632972389, 'Chevy', 'Dicke', '2018-01-16', 'A', 3187481586, NULL, 'cdickedk@plala.or.jp', 60);
select ajouter_patient(2808101904475, 'Ivor', 'Sharpin', '2013-01-22', 'F', 4602911142, NULL, 'isharpindl@cyberchimps.com', 59);
select ajouter_patient(310368709832, 'Norine', 'Grgic', '1943-01-13', 'F', 4737398547, NULL, 'ngrgicdm@sbwire.com', 48);
select ajouter_patient(6329833735983, 'Edeline', 'Astles', '1998-02-17', 'H', 6736450204, NULL, 'eastlesdn@harvard.edu', 20);
select ajouter_patient(6788012822207, 'Mal', 'Sidle', '1983-03-11', 'F', 2082856803, NULL, 'msidledo@squidoo.com', 39);
select ajouter_patient(1890245518345, 'Ab', 'Jowitt', '2013-03-25', 'F', 4640521616, NULL, 'ajowittdp@yandex.ru', 38);
select ajouter_patient(7025805164522, 'Tony', 'Ciccerale', '1951-11-25', 'A', 6118226583, NULL, 'tcicceraledq@ihg.com', 37);
select ajouter_patient(5320959655648, 'Evelin', 'Fyall', '1988-07-08', 'H', 6733241300, NULL, 'efyalldr@youtu.be', 94);
select ajouter_patient(7201185388910, 'Benjamen', 'Richings', '1945-08-09', 'H', 1514551632, NULL, 'brichingsds@columbia.edu', 54);
select ajouter_patient(9725102549083, 'Nessie', 'Hagergham', '1925-08-24', 'A', 6545422953, NULL, 'nhagerghamdt@liveinternet.ru', 62);
select ajouter_patient(1806762130705, 'Laird', 'Bellard', '1963-05-29', 'A', 4578009121, NULL, 'lbellarddu@yale.edu', 63);
select ajouter_patient(2553333410859, 'Elijah', 'Sheardown', '1992-07-19', 'H', 296390930, NULL, 'esheardowndv@altervista.org', 78);

INSERT INTO hopital (capaciteMax, nom, tauxMax, placeOccupe, placeLibre, adresseh, iddep) VALUES
(55, 'Stiedemann-Grant', 63.26, 0, 55, '8553 Kinsman Court', 39),
(696, 'Schulist-Kautzer', 29.47, 0, 696, '598 Graceland Hill', 66),
(349, 'Metz-Cartwright', 3.02, 0, 349, '14 Thackeray Center', 68),
(58, 'Langworth, Bergnaum and O''Keefe', 80.71, 0, 58, '8 Mallory Parkway', 45),
(871, 'Gutmann and Sons', 13.98, 0, 871, '2 Stoughton Center', 85),
(77, 'Schneider-Beer', 84.35, 0, 77, '416 Norway Maple Avenue', 76),
(175, 'Rogahn-Feil', 50.26, 0, 175, '2363 Graedel Parkway', 56),
(544, 'Predovic and Sons', 97.12, 0, 544, '89 Bluejay Plaza', 3),
(423, 'Reichel, Hintz and Bahringer', 35.17, 0, 423, '653 Sunfield Hill', 74),
(15, 'Ledner, Kuhn and Heidenreich', 17.24, 0, 15, '6 Duke Lane', 80),
(603, 'Emard-Rice', 96.33, 0, 603, '35 North Drive', 51),
(506, 'Hand Group', 99.34, 0, 506, '09751 Menomonie Street', 20),
(688, 'Lindgren-Anderson', 80.12, 0, 688, '6680 Lakewood Drive', 65),
(430, 'Rippin-Becker', 82.04, 0, 430, '6224 Anzinger Street', 76),
(357, 'Yost-Fahey', 61.31, 0, 357, '8435 La Follette Junction', 52),
(235, 'Gislason Group', 37.24, 0, 235, '2646 3rd Lane', 69),
(615, 'O''Hara-Kris', 19.86, 0, 615, '15 Elgar Hill', 41),
(587, 'Schneider Group', 91.48, 0, 587, '8 Dakota Park', 69),
(423, 'Hegmann-Torp', 6.77, 0, 423, '80 Sutteridge Junction', 56),
(134, 'Thiel LLC', 22.1, 0, 134, '40992 Clemons Court', 46),
(593, 'Predovic LLC', 0.83, 0, 593, '847 Buell Drive', 30),
(184, 'Schiller Group', 89.78, 0, 184, '92 Truax Crossing', 15),
(625, 'Koelpin-Lesch', 80.73, 0, 625, '03 Sycamore Crossing', 92),
(126, 'Haley, Jast and Hegmann', 68.18, 0, 126, '70 Crescent Oaks Plaza', 53),
(884, 'Smitham-Lind', 79.22, 0, 884, '96 Eastwood Lane', 83),
(346, 'Renner-Schuppe', 66.88, 0, 346, '6 Sauthoff Place', 6),
(349, 'Schiller, Hessel and Stokes', 47.2, 0, 349, '52 Golf View Crossing', 12),
(438, 'Trantow, Medhurst and Fisher', 72.68, 0, 438, '866 Hagan Trail', 25),
(832, 'Stroman Group', 23.53, 0, 832, '9 Hooker Point', 8),
(500, 'Pfannerstill, Upton and Koepp', 61.76, 0, 500, '94866 Atwood Way', 34),
(151, 'Gutmann LLC', 25.68, 0, 151, '206 Oak Crossing', 50),
(686, 'Koch-Dooley', 34.94, 0, 686, '590 Di Loreto Trail', 2),
(377, 'Schmidt and Sons', 2.17, 0, 377, '116 Northview Point', 85),
(729, 'Crist, Beatty and Kling', 93.46, 0, 729, '8 Derek Circle', 32),
(924, 'Botsford LLC', 8.1, 0, 924, '7085 Bay Court', 33),
(795, 'Yundt Group', 35.11, 0, 795, '63940 Morrow Park', 45),
(722, 'Lesch and Sons', 76.48, 0, 722, '7 Sage Pass', 20),
(790, 'Denesik-Kohler', 9.95, 0, 790, '6496 Pepper Wood Court', 66),
(454, 'Zulauf-Lebsack', 65.53, 0, 454, '42 Bartillon Pass', 79),
(698, 'Stoltenberg and Sons', 63.91, 0, 698, '72 Roth Point', 8),
(440, 'Beier and Sons', 8.58, 0, 440, '386 Luster Hill', 76),
(470, 'Brakus-Collins', 54.42, 0, 470, '14939 Crowley Center', 87),
(592, 'Rohan-Keeling', 19.91, 0, 592, '55 Tomscot Terrace', 55),
(76, 'Berge Inc', 66.93, 0, 76, '0 Del Sol Crossing', 17),
(651, 'Walsh and Sons', 63.66, 0, 651, '2891 Kropf Circle', 87),
(916, 'Padberg LLC', 4.98, 0, 916, '587 Kim Park', 28),
(780, 'Wiza-Adams', 36.14, 0, 780, '78912 Grayhawk Junction', 48),
(33, 'Corkery-Mayert', 94.39, 0, 33, '653 Banding Alley', 64),
(323, 'Rosenbaum-Stokes', 27.94, 0, 323, '29473 Luster Place', 14),
(259, 'Marquardt, Lubowitz and Jacobson', 8.15, 0, 259, '7 Colorado Trail', 21),
(583, 'Kohler, Ritchie and Roberts', 64.4, 0, 583, '7 Holy Cross Road', 86),
(811, 'Brekke LLC', 8.06, 0, 811, '43967 Grim Parkway', 36),
(372, 'Runolfsson LLC', 31.82, 0, 372, '13239 Hagan Place', 55),
(849, 'Hayes-Hauck', 65.55, 0, 849, '10255 Nobel Avenue', 26),
(87, 'Sawayn Group', 10.99, 0, 87, '18 Clove Street', 52),
(562, 'Botsford-Feeney', 78.12, 0, 562, '6 Katie Terrace', 51),
(562, 'Hyatt Inc', 9.84, 0, 562, '4 Eastlawn Way', 70),
(738, 'Powlowski Group', 79.6, 0, 738, '87 5th Junction', 89),
(884, 'Cummings, Herman and Bogisich', 58.64, 0, 884, '4624 Gerald Alley', 49),
(593, 'Tremblay, Legros and Koepp', 41.85, 0, 593, '180 Erie Street', 34),
(120, 'Schaefer and Sons', 8.21, 0, 120, '688 Anthes Crossing', 92),
(789, 'Treutel and Sons', 76.29, 0, 789, '0 Maple Wood Trail', 87),
(911, 'Eichmann, White and Padberg', 18.28, 0, 911, '055 Pond Lane', 15),
(320, 'Stamm, Hettinger and Balistreri', 5.41, 0, 320, '62099 Chive Pass', 65),
(933, 'Bernier-Thiel', 6.11, 0, 933, '259 Bashford Crossing', 5),
(844, 'Gaylord-Champlin', 99.76, 0, 844, '95149 Onsgard Center', 35),
(132, 'Schuster and Sons', 55.96, 0, 132, '947 Memorial Junction', 58),
(407, 'Nienow-Ondricka', 37.47, 0, 407, '932 Dayton Pass', 33),
(394, 'Corkery LLC', 52.89, 0, 394, '70515 Logan Lane', 61),
(818, 'Morissette, Collier and Toy', 56.95, 0, 818, '572 Karstens Court', 11),
(117, 'Sauer, Schimmel and Will', 89.1, 0, 117, '53728 Mitchell Plaza', 67),
(719, 'Durgan and Sons', 99.71, 0, 719, '899 Rockefeller Plaza', 82),
(398, 'Adams, Lockman and Kovacek', 45.21, 0, 398, '54 Browning Drive', 1),
(510, 'Hermann, Conroy and Bogan', 22.78, 0, 510, '4211 Melby Avenue', 18),
(532, 'Reichel, Champlin and Reichert', 34.27, 0, 532, '9539 Miller Alley', 92),
(691, 'Pollich, Mayert and Cruickshank', 22.48, 0, 691, '7 Mandrake Junction', 74),
(382, 'Leannon Inc', 94.52, 0, 382, '2080 Crowley Court', 73),
(702, 'Dickinson, Pagac and Ryan', 27.85, 0, 702, '8314 Thierer Alley', 76),
(617, 'Windler and Sons', 94.65, 0, 617, '4057 Bluejay Street', 57),
(109, 'Connelly-Gibson', 27.1, 0, 109, '2 Leroy Place', 37),
(276, 'Kris-Douglas', 52.27, 0, 276, '1996 Oak Valley Point', 6),
(389, 'Ankunding Inc', 40.17, 0, 389, '28 Lunder Terrace', 68),
(163, 'Von-Keebler', 89.33, 0, 163, '2 Clove Hill', 73),
(981, 'Ebert-Braun', 56.71, 0, 981, '3871 Petterle Center', 40),
(680, 'Boehm and Sons', 91.44, 0, 680, '445 Sachtjen Park', 88),
(658, 'Greenholt, Hauck and Fritsch', 67.6, 0, 658, '43 Memorial Street', 40),
(928, 'Hayes, Steuber and Pfeffer', 12.95, 0, 928, '658 Carberry Court', 22),
(260, 'Legros LLC', 26.75, 0, 260, '4 Talmadge Hill', 4),
(993, 'Runte-Smith', 19.83, 0, 993, '08 Stuart Pass', 76),
(426, 'Hintz LLC', 54.53, 0, 426, '451 Southridge Place', 38),
(173, 'Macejkovic-Bosco', 78.77, 0, 173, '4 Sutherland Court', 54),
(249, 'Tromp-McGlynn', 48.86, 0, 249, '20051 Mayer Street', 70),
(881, 'O''Conner and Sons', 14.73, 0, 881, '88041 Haas Plaza', 43),
(66, 'Stehr and Sons', 11.2, 0, 66, '28254 Golf Crossing', 83),
(944, 'Tremblay, Christiansen and Beahan', 22.69, 0, 944, '5420 Chinook Parkway', 53),
(256, 'Raynor LLC', 87.62, 0, 256, '86243 Forster Lane', 35),
(121, 'Olson, Witting and Zboncak', 56.38, 0, 121, '132 Ridge Oak Center', 51),
(840, 'Bashirian-Breitenberg', 66.4, 0, 840, '029 Grasskamp Hill', 59),
(83, 'Oberbrunner-Wiza', 19.81, 0, 83, '3 Sommers Hill', 15),
(902, 'Goodwin, Miller and Feeney', 6.35, 0, 902, '10159 Village Green Center', 95),
(852, 'Ledner, Bogisich and Cole', 16.13, 0, 852, '06 Maple Street', 18),
(206, 'Hermiston Group', 55.47, 0, 206, '7334 Cascade Road', 75),
(435, 'Hermann, VonRueden and Konopelski', 44.15, 0, 435, '79 Carberry Pass', 8),
(800, 'Kreiger, Dach and Funk', 65.15, 0, 800, '67 Blaine Park', 14),
(72, 'Hirthe-Klein', 95.17, 0, 72, '97395 Moose Pass', 58),
(609, 'Schmidt, Schulist and Crist', 4.73, 0, 609, '643 Schmedeman Pass', 20),
(578, 'Harber-Herzog', 35.22, 0, 578, '517 Michigan Avenue', 68),
(433, 'Leffler LLC', 19.64, 0, 433, '97 Fairfield Road', 50),
(770, 'Gleason, Mohr and Little', 39.55, 0, 770, '23 Loomis Crossing', 12),
(912, 'Romaguera, Kilback and Gulgowski', 36.85, 0, 912, '8566 Ronald Regan Terrace', 28),
(211, 'King, Lehner and Zemlak', 87.89, 0, 211, '549 Florence Point', 12),
(566, 'Crooks, Hettinger and Hermiston', 85.0, 566, 0, '1 Cottonwood Terrace', 72),
(852, 'Klocko Inc', 25.68, 0, 852, '07 Anniversary Plaza', 26),
(415, 'Altenwerth, Stoltenberg and Metz', 43.47, 0, 415, '076 Farragut Lane', 15),
(86, 'Ziemann, Windler and Hackett', 50.37, 0, 86, '55402 Eastwood Road', 78),
(214, 'Bauch, Koepp and Wisoky', 74.35, 0, 214, '2627 Sommers Street', 30),
(860, 'Aufderhar LLC', 16.25, 0, 860, '6 Toban Way', 46),
(889, 'Osinski, Veum and Spinka', 95.1, 0, 889, '408 Meadow Valley Center', 38),
(726, 'Becker, Rempel and Thiel', 36.55, 0, 726, '4716 Lillian Place', 60),
(188, 'Zulauf, Dickinson and Wisoky', 31.14, 0, 188, '673 Prairie Rose Circle', 95),
(896, 'Kreiger and Sons', 11.54, 0, 896, '9972 Kensington Center', 44),
(422, 'Mohr-Klocko', 32.01, 0, 422, '11 Roth Crossing', 41),
(953, 'Larkin Group', 21.25, 0, 953, '6349 Stone Corner Drive', 84),
(500, 'Jacobs LLC', 83.89, 0, 500, '96 Debra Plaza', 56),
(89, 'Jerde-Quigley', 79.92, 0, 89, '7 Bay Court', 46),
(27, 'Pollich Inc', 54.54, 0, 27, '81 Hudson Park', 11),
(848, 'Herman, Kuhn and Kiehn', 54.98, 0, 848, '085 Lotheville Junction', 44),
(644, 'Collins, Schowalter and Hickle', 91.89, 0, 644, '21963 Dapin Alley', 45),
(310, 'King Inc', 54.66, 0, 310, '0643 Shasta Circle', 76),
(487, 'Frami-Zieme', 93.91, 0, 487, '0314 Alpine Drive', 33),
(194, 'Olson and Sons', 56.65, 0, 194, '422 Lawn Parkway', 35),
(260, 'Klein, McDermott and Cruickshank', 28.22, 0, 260, '22979 Bowman Street', 3),
(455, 'Konopelski Group', 7.75, 0, 455, '5 Mariners Cove Junction', 24),
(809, 'Mante LLC', 82.55, 0, 809, '8157 Anderson Point', 35),
(890, 'Fay-Brekke', 8.27, 0, 890, '16 Dexter Park', 42),
(574, 'Hahn-Goyette', 2.0, 574, 0, '9 Talisman Hill', 58),
(818, 'Olson LLC', 97.13, 0, 818, '5875 Everett Center', 94),
(860, 'Jerde, Crist and Haag', 31.57, 0, 860, '762 Pierstorff Court', 87),
(811, 'Jakubowski-Bailey', 81.59, 0, 811, '5406 Rutledge Junction', 90),
(919, 'Rolfson LLC', 93.95, 0, 919, '8 Pleasure Plaza', 33),
(639, 'Howe LLC', 20.62, 0, 639, '50 Summer Ridge Road', 71),
(103, 'Bruen, Wehner and Robel', 95.79, 0, 103, '50 Farmco Drive', 82),
(834, 'Baumbach-Koepp', 46.12, 0, 834, '97521 Golf Pass', 1),
(805, 'Stoltenberg and Sons', 39.71, 0, 805, '84 Mayer Trail', 57),
(508, 'Kautzer-Schuppe', 84.14, 0, 508, '7782 Maple Wood Court', 52),
(104, 'Kassulke, Schoen and Muller', 97.96, 0, 104, '00438 Armistice Junction', 59),
(414, 'Casper Group', 20.61, 0, 414, '3168 Clemons Road', 29),
(820, 'Gorczany-McGlynn', 50.24, 0, 820, '31 Mayfield Park', 52),
(653, 'Greenfelder, Ebert and Kilback', 58.59, 0, 653, '02188 Arapahoe Court', 21),
(18, 'Sawayn and Sons', 66.03, 0, 18, '83628 Hintze Street', 50),
(928, 'Medhurst, Becker and Grady', 3.92, 0, 928, '8492 Fieldstone Center', 75),
(861, 'Dickens, Wintheiser and Considine', 93.24, 0, 861, '60 Hagan Lane', 80),
(453, 'O''Keefe Group', 87.2, 0, 453, '47307 Cody Plaza', 10),
(717, 'Bayer and Sons', 20.27, 0, 717, '22832 Vidon Drive', 49),
(383, 'Pacocha, Grant and Koch', 33.07, 0, 383, '32 Lukken Plaza', 94),
(194, 'Trantow, Quitzon and Quigley', 18.36, 0, 194, '9 Main Court', 23),
(952, 'Hackett and Sons', 25.48, 0, 952, '475 Warbler Plaza', 24),
(519, 'Auer-Lubowitz', 38.73, 0, 519, '43490 Stephen Avenue', 68),
(924, 'Boyer LLC', 83.44, 0, 924, '0279 Kensington Park', 94),
(169, 'Miller LLC', 70.87, 0, 169, '11 Clarendon Center', 17),
(106, 'Thiel-Stiedemann', 89.93, 0, 106, '0 Barnett Street', 69),
(112, 'Mann LLC', 20.02, 0, 112, '361 Marcy Avenue', 33),
(426, 'Schuster Group', 36.26, 0, 426, '05225 Main Road', 57),
(116, 'Rowe-Waters', 62.38, 0, 116, '653 Harbort Alley', 30),
(273, 'Romaguera, Murray and Schimmel', 11.86, 0, 273, '214 Debra Lane', 39),
(908, 'Sawayn, Johnston and Eichmann', 77.63, 0, 908, '39 Lerdahl Point', 14),
(712, 'Dibbert, Johns and Fahey', 99.51, 0, 712, '7 Parkside Junction', 53),
(950, 'DuBuque and Sons', 53.7, 0, 950, '824 Granby Lane', 89),
(420, 'Hoeger-Bashirian', 24.87, 0, 420, '692 Judy Terrace', 87),
(731, 'Schmeler Group', 26.79, 0, 731, '659 Butterfield Crossing', 20),
(635, 'MacGyver, Hoppe and Becker', 59.09, 0, 635, '2631 Blackbird Crossing', 66),
(223, 'Kris-Ferry', 97.83, 0, 223, '68 Graedel Way', 35),
(961, 'Champlin-Cummings', 59.94, 0, 961, '4528 Ronald Regan Street', 30),
(380, 'Cronin-Weber', 34.51, 0, 380, '77272 Derek Court', 30),
(323, 'Friesen Group', 41.81, 0, 323, '9911 Sherman Center', 80),
(537, 'Kirlin, Tillman and Murray', 34.77, 0, 537, '4654 Steensland Circle', 1),
(917, 'Goyette-Hickle', 53.87, 0, 917, '67 Dakota Junction', 28),
(341, 'Wehner-Lehner', 15.44, 0, 341, '0 Starling Lane', 15),
(315, 'Bednar Inc', 70.01, 0, 315, '71 Doe Crossing Place', 19),
(973, 'Pfeffer Group', 51.42, 0, 973, '58969 South Point', 80),
(236, 'Gorczany and Sons', 61.81, 0, 236, '9130 Graedel Center', 20),
(328, 'Rohan, Ferry and Maggio', 46.73, 0, 328, '84595 Dayton Trail', 73),
(504, 'Hessel Inc', 27.77, 0, 504, '58 Dixon Alley', 22),
(82, 'Marks-Hartmann', 65.44, 0, 82, '9881 Ridgeway Avenue', 42),
(751, 'Mertz and Sons', 79.75, 0, 751, '375 Prentice Drive', 41),
(538, 'Considine Inc', 24.88, 0, 538, '19 Summer Ridge Drive', 10),
(240, 'Funk-Kilback', 47.58, 0, 240, '125 Blackbird Drive', 22),
(260, 'Leffler LLC', 37.72, 0, 260, '596 Fuller Street', 80),
(645, 'Nolan, Orn and Kerluke', 21.55, 0, 645, '13 Prairieview Road', 4),
(324, 'Mayert-Paucek', 89.27, 0, 324, '1819 Fieldstone Pass', 59),
(787, 'Ernser-Champlin', 46.89, 0, 787, '76390 Grover Parkway', 27),
(136, 'Fay-Bergstrom', 58.18, 0, 136, '92 Linden Way', 44),
(932, 'Kuhlman LLC', 39.07, 0, 932, '4 Blaine Court', 52),
(973, 'Murazik, Cole and Predovic', 49.95, 0, 973, '882 Grim Lane', 27),
(219, 'Hamill and Sons', 67.36, 0, 219, '4249 Sugar Terrace', 3),
(131, 'Kerluke-Turcotte', 70.17, 0, 131, '33536 Karstens Parkway', 73),
(144, 'Borer, Runte and Botsford', 75.14, 0, 144, '23 Moose Plaza', 66),
(854, 'Parker, Hudson and West', 39.31, 0, 854, '952 Oneill Plaza', 57),
(982, 'Borer, Steuber and Haag', 98.78, 0, 982, '5 Caliangt Road', 69),
(522, 'Koepp Group', 38.12, 0, 522, '8995 Clyde Gallagher Alley', 28),
(499, 'Borer Inc', 71.65, 0, 499, '0 Rigney Center', 28),
(406, 'Carroll LLC', 21.02, 0, 406, '7320 Calypso Drive', 75),
(882, 'Erdman-Kshlerin', 18.3, 0, 882, '00841 Bartelt Street', 59),
(378, 'Botsford-Kiehn', 41.24, 0, 378, '8813 Gale Point', 26),
(687, 'Hammes-Spencer', 18.14, 0, 687, '65179 South Drive', 66),
(237, 'Streich and Sons', 76.08, 0, 237, '163 Schiller Drive', 44),
(307, 'Lebsack Group', 91.66, 0, 307, '12002 Bashford Avenue', 68),
(241, 'Berge, Tillman and Kris', 2.46, 0, 241, '0849 Vahlen Alley', 32),
(237, 'Littel, Ryan and Mohr', 17.03, 0, 237, '97 Schlimgen Alley', 75),
(463, 'Johnston and Sons', 68.9, 0, 463, '74531 Vidon Way', 32),
(255, 'Monahan, Quitzon and Renner', 55.32, 0, 255, '360 Jay Lane', 36),
(318, 'Runolfsson Inc', 27.27, 0, 318, '3 Derek Center', 56),
(786, 'Schuster-Greenfelder', 41.69, 0, 786, '838 Dryden Alley', 70),
(511, 'Hagenes-Champlin', 15.6, 0, 511, '72963 Thompson Pass', 44),
(988, 'D''Amore, Wolf and Ferry', 35.32, 0, 988, '1 Everett Lane', 5),
(795, 'Wyman, Stark and Kassulke', 2.84, 0, 795, '00113 Thompson Junction', 75),
(630, 'Carter-Veum', 95.9, 0, 630, '8882 Fairfield Drive', 7),
(121, 'Leannon Group', 18.23, 0, 121, '84 Golf Court', 87),
(272, 'Hackett, Kihn and Bogan', 23.64, 0, 272, '2364 Holy Cross Park', 94),
(855, 'O''Reilly, Veum and Fisher', 78.95, 0, 855, '37 Goodland Terrace', 54),
(695, 'Parker-Haley', 42.99, 0, 695, '858 Eggendart Road', 12),
(688, 'Hartmann Group', 88.18, 0, 688, '64 Forster Plaza', 63),
(347, 'Trantow-Stehr', 47.68, 0, 347, '160 Ryan Trail', 63),
(226, 'Bayer-Wiegand', 23.31, 0, 226, '6563 Forest Street', 35),
(520, 'Crona LLC', 4.6, 0, 520, '0 Schiller Avenue', 62),
(434, 'Hermiston-Rohan', 91.9, 0, 434, '950 Lerdahl Center', 44),
(673, 'Schmeler-Botsford', 56.78, 0, 673, '7711 Anthes Hill', 72),
(897, 'Schoen and Sons', 43.34, 0, 897, '80502 Monterey Trail', 56),
(963, 'Feest, Spencer and Littel', 16.25, 0, 963, '61804 Prairie Rose Point', 68),
(234, 'Marquardt and Sons', 71.14, 0, 234, '521 Straubel Court', 65),
(828, 'Johnson-Zboncak', 24.08, 0, 828, '2871 Colorado Crossing', 68),
(524, 'Hahn, Dibbert and Parker', 72.89, 0, 524, '98553 La Follette Street', 67),
(477, 'Bins and Sons', 3.1, 0, 477, '52950 Alpine Alley', 53),
(353, 'Kovacek, Fadel and Ratke', 89.71, 0, 353, '3 Moose Parkway', 27),
(427, 'Hermiston, Huels and Keebler', 37.46, 0, 427, '90214 Morning Crossing', 8),
(995, 'Aufderhar-Little', 56.43, 0, 995, '5 Heffernan Trail', 72),
(400, 'Boyle and Sons', 61.2, 0, 400, '270 Texas Alley', 55),
(808, 'Boyer, Dibbert and Johns', 34.3, 0, 808, '96681 Forest Lane', 53),
(271, 'Osinski-Wilkinson', 55.92, 0, 271, '23816 Northridge Pass', 56),
(784, 'Schmeler, Brakus and Smith', 38.3, 0, 784, '32888 Sauthoff Plaza', 12),
(403, 'Bruen-Cremin', 44.04, 0, 403, '96362 Vidon Avenue', 40),
(114, 'Dibbert Inc', 58.2, 0, 114, '336 Packers Way', 34),
(684, 'Kuhlman, Kihn and Harris', 50.17, 0, 684, '8 Lien Drive', 51),
(936, 'Schulist, Mann and Wilderman', 93.82, 0, 936, '13 Village Green Alley', 42),
(279, 'Barrows Inc', 18.19, 0, 279, '08 Nevada Place', 67),
(603, 'Ritchie-Lakin', 74.95, 0, 603, '38 Larry Terrace', 20),
(684, 'Schuppe-Lang', 63.28, 0, 684, '9868 Bunker Hill Point', 78),
(911, 'Sauer-Osinski', 61.66, 0, 911, '10215 Badeau Street', 3),
(869, 'Bergstrom, Larkin and Hudson', 34.16, 0, 869, '839 Talmadge Alley', 69),
(709, 'Mills-Baumbach', 48.05, 0, 709, '768 Erie Pass', 52),
(804, 'Zulauf, Sipes and Pollich', 32.95, 0, 804, '8 Moulton Trail', 36),
(650, 'Ruecker, Lesch and McLaughlin', 27.77, 0, 650, '18928 Clemons Crossing', 27),
(598, 'Watsica-Bailey', 51.66, 0, 598, '6 Sutherland Pass', 15),
(5, 'Anderson-Renner', 98.61, 0, 5, '73 Carioca Junction', 7),
(456, 'Marks-Lemke', 37.07, 0, 456, '79437 Anthes Point', 52),
(874, 'Gorczany-Williamson', 85.0, 874, 0, '157 Manufacturers Court', 13),
(424, 'Blanda, Kulas and Gibson', 71.18, 0, 424, '17 Morrow Way', 41),
(481, 'Runolfsson Inc', 93.16, 0, 481, '62773 Melody Plaza', 3),
(116, 'Lesch Inc', 64.76, 0, 116, '461 Helena Terrace', 16),
(815, 'Gaylord LLC', 20.96, 0, 815, '19624 Dennis Avenue', 71),
(915, 'Erdman-Moen', 28.05, 0, 915, '924 Gerald Junction', 47),
(140, 'Olson and Sons', 35.0, 140, 0, '57 Washington Pass', 16),
(251, 'Monahan-Considine', 93.61, 0, 251, '1 Dakota Pass', 10),
(596, 'Bechtelar, Schulist and Nader', 63.21, 0, 596, '8 Cascade Hill', 95),
(88, 'Bogan-Kuhn', 62.98, 0, 88, '7 Drewry Pass', 19),
(910, 'Wolf-Balistreri', 14.52, 0, 910, '89543 Mesta Park', 71),
(133, 'Haley and Sons', 61.0, 133, 0, '9 Brown Road', 60),
(379, 'Denesik Inc', 12.08, 0, 379, '9838 Lake View Way', 56),
(210, 'Kihn Group', 93.27, 0, 210, '37 Commercial Place', 22),
(630, 'Reilly, Leffler and Lakin', 94.62, 0, 630, '214 Rigney Plaza', 28),
(782, 'Boehm-Reichert', 76.89, 0, 782, '54098 Declaration Lane', 30),
(402, 'Ferry, Boyle and Mann', 15.93, 0, 402, '99 Bunker Hill Hill', 23),
(902, 'Wyman, Bosco and Schmeler', 53.12, 0, 902, '7873 Corry Pass', 36),
(964, 'Ritchie Inc', 68.11, 0, 964, '5774 Summer Ridge Place', 7),
(480, 'Greenholt and Sons', 90.81, 0, 480, '74417 Monterey Trail', 39),
(738, 'Jerde LLC', 73.57, 0, 738, '1821 Susan Junction', 13),
(367, 'Hettinger, Schaden and Gleichner', 59.68, 0, 367, '4606 Talmadge Center', 59),
(541, 'Baumbach-Schuster', 25.75, 0, 541, '908 Beilfuss Point', 95),
(618, 'Bayer-Corwin', 35.79, 0, 618, '020 Merchant Park', 77),
(965, 'Osinski, Schaden and Mitchell', 97.83, 0, 965, '0501 Vahlen Center', 84),
(73, 'Gleason and Sons', 47.34, 0, 73, '64143 Straubel Alley', 39),
(844, 'Reilly LLC', 60.44, 0, 844, '4 Pierstorff Drive', 47),
(436, 'Ratke-Hickle', 67.31, 0, 436, '270 Cherokee Place', 62),
(629, 'Stokes and Sons', 42.17, 0, 629, '84082 Karstens Park', 5),
(930, 'Windler Group', 27.38, 0, 930, '388 Canary Lane', 79),
(268, 'Spencer, Senger and Medhurst', 82.05, 0, 268, '039 Jackson Plaza', 7),
(124, 'Reynolds LLC', 34.78, 0, 124, '279 Arkansas Circle', 49),
(66, 'Nader, Walter and Ward', 24.46, 0, 66, '4648 Hermina Place', 29),
(452, 'Homenick-Quigley', 82.06, 0, 452, '41 Redwing Place', 88),
(300, 'Crona and Sons', 44.25, 0, 300, '9 Loeprich Park', 42),
(787, 'Mosciski-Collins', 64.82, 0, 787, '5214 Rutledge Terrace', 48),
(33, 'Murray, Mayert and Armstrong', 64.06, 0, 33, '58 Duke Place', 87),
(124, 'Wolf-Kutch', 12.45, 0, 124, '7267 Pennsylvania Point', 90),
(611, 'Heathcote-Gottlieb', 57.85, 0, 611, '3 Crowley Way', 9),
(378, 'Rice, Lubowitz and Lehner', 22.73, 0, 378, '94293 Coleman Way', 14),
(517, 'Hackett, Bechtelar and Luettgen', 63.82, 0, 517, '4 Scoville Drive', 6),
(164, 'Dickens, Gleichner and Stokes', 76.31, 0, 164, '451 Acker Place', 6),
(469, 'Rosenbaum, Lowe and Toy', 34.67, 0, 469, '42902 Farragut Alley', 1),
(820, 'Bogisich, Lindgren and Mills', 20.44, 0, 820, '38 Daystar Street', 68),
(28, 'Hoeger-Armstrong', 69.02, 0, 28, '7 Lakeland Park', 73),
(150, 'St. Ursula', 50, 0, 150, 'Crossbell', 90),
(5, 'CHRU', 45, 0, 5, 'Nancy', 54),
(100, 'St.Joseph', 20, 0, 100, '185 Rue Raymond Losserand, 75014 Paris', 75);
