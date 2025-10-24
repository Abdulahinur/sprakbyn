class VocabularyEntry {
  final String swedish;
  final Map<String, String> translations;

  const VocabularyEntry({
    required this.swedish,
    required this.translations,
  });
}

class CategoryContent {
  final List<String> focusAreas;
  final List<String> phrases;
  final List<String> tips;
  final List<VocabularyEntry> vocabulary;

  const CategoryContent({
    required this.focusAreas,
    required this.phrases,
    required this.tips,
    required this.vocabulary,
  });
}

const List<String> translationLanguages = ['engelska', 'arabiska', 'somaliska'];

const CategoryContent _defaultContent = CategoryContent(
  focusAreas: [
    'Hälsningsfraser och presentationer',
    'Vanliga ord på arbetsplatsen',
    'Kommunikation med kollegor och kunder',
  ],
  phrases: [
    'Hej! Jag heter ... och jag börjar jobba här idag.',
    'Kan du visa mig hur jag gör det här?',
    'Tack så mycket för hjälpen!'
  ],
  tips: [
    'Öva lite varje dag – fem minuter räcker.',
    'Lyssna på hur kollegor uttrycker sig och skriv ner nya ord.',
    'Våga ställa frågor. Det visar att du vill lära dig.',
  ],
  vocabulary: [
    VocabularyEntry(
      swedish: 'hej',
      translations: {'engelska': 'hello', 'arabiska': 'مرحبا', 'somaliska': 'iska warran'},
    ),
    VocabularyEntry(
      swedish: 'tack',
      translations: {'engelska': 'thank you', 'arabiska': 'شكرا', 'somaliska': 'mahadsanid'},
    ),
    VocabularyEntry(
      swedish: 'kollega',
      translations: {'engelska': 'colleague', 'arabiska': 'زميل', 'somaliska': 'saaxiib shaqo'},
    ),
    VocabularyEntry(
      swedish: 'rast',
      translations: {'engelska': 'break', 'arabiska': 'استراحة', 'somaliska': 'nasasho'},
    ),
  ],
);

const Map<String, CategoryContent> _categoryContent = {
  'construction': CategoryContent(
    focusAreas: [
      'Verktyg och maskiner på byggplatsen',
      'Säkerhetsutrustning och arbetsmiljö',
      'Instruktioner från arbetsledare',
      'Teamarbete och planering',
    ],
    phrases: [
      'Kan du räcka mig skruvdragaren?',
      'Var ska jag lämna materialet?',
      'Kan du visa mig hur den här maskinen fungerar?',
    ],
    tips: [
      'Repetera säkerhetsrutiner med en kollega innan arbetsdagen börjar.',
      'Fotografera skyltar och anteckningar för att plugga nya ord i mobilen.',
      'Säg till när du inte förstår – det är viktigt för din säkerhet.',
    ],
    vocabulary: [
      VocabularyEntry(
        swedish: 'hammare',
        translations: {'engelska': 'hammer', 'arabiska': 'مطرقة', 'somaliska': 'dubbe'},
      ),
      VocabularyEntry(
        swedish: 'skyddshjälm',
        translations: {'engelska': 'helmet', 'arabiska': 'خوذة', 'somaliska': 'koofiyada badbaadada'},
      ),
      VocabularyEntry(
        swedish: 'skruvdragare',
        translations: {'engelska': 'power drill', 'arabiska': 'مفك كهربائي', 'somaliska': 'mashiinka furaha'},
      ),
      VocabularyEntry(
        swedish: 'ritning',
        translations: {'engelska': 'blueprint', 'arabiska': 'مخطط', 'somaliska': 'naqshad'},
      ),
    ],
  ),
  'transport': CategoryContent(
    focusAreas: [
      'Leveransplanering och rutter',
      'Kontakt med kunder och mottagare',
      'Fordonsdelar och lastning',
      'Säker och hållbar körning',
    ],
    phrases: [
      'Jag är framme om tio minuter.',
      'Kan du bekräfta mottagningen av paketet?',
      'Var kan jag parkera lastbilen?',
    ],
    tips: [
      'Använd navigation på svenska för att vänja dig vid vägskyltar.',
      'Bekräfta adresser och tider muntligt för att undvika missförstånd.',
      'Gör en kort fordonskontroll varje morgon och säg högt vad du kontrollerar.',
    ],
    vocabulary: [
      VocabularyEntry(
        swedish: 'leverans',
        translations: {'engelska': 'delivery', 'arabiska': 'تسليم', 'somaliska': 'gaarsiin'},
      ),
      VocabularyEntry(
        swedish: 'lastbil',
        translations: {'engelska': 'truck', 'arabiska': 'شاحنة', 'somaliska': 'gaari xamuul'},
      ),
      VocabularyEntry(
        swedish: 'fraktsedel',
        translations: {'engelska': 'consignment note', 'arabiska': 'بوليسة شحن', 'somaliska': 'warqad xamuul'},
      ),
      VocabularyEntry(
        swedish: 'parkering',
        translations: {'engelska': 'parking', 'arabiska': 'موقف سيارات', 'somaliska': 'baarkin'},
      ),
    ],
  ),
  'cleaning': CategoryContent(
    focusAreas: [
      'Rengöringsmedel och utrustning',
      'Dagliga och veckovisa rutiner',
      'Kundbemötande och kommunikation',
      'Arbetsmiljö och ergonomi',
    ],
    phrases: [
      'Var vill du att jag börjar?',
      'Vilket medel använder ni för golvet?',
      'Det här rummet är klart nu.',
    ],
    tips: [
      'Säg högt vad du gör – det hjälper både dig och kunden att följa arbetet.',
      'Ha en lista med standardord i fickan som du kan repetera under raster.',
      'Kontrollera alltid att utrustningen är hel innan du startar.',
    ],
    vocabulary: [
      VocabularyEntry(
        swedish: 'mopp',
        translations: {'engelska': 'mop', 'arabiska': 'ممسحة', 'somaliska': 'masax'},
      ),
      VocabularyEntry(
        swedish: 'rengöringsmedel',
        translations: {'engelska': 'cleaning agent', 'arabiska': 'منظف', 'somaliska': 'saabuun nadiifineed'},
      ),
      VocabularyEntry(
        swedish: 'sopborste',
        translations: {'engelska': 'broom', 'arabiska': 'مكنسة', 'somaliska': 'fargeeto'},
      ),
      VocabularyEntry(
        swedish: 'trasor',
        translations: {'engelska': 'cloths', 'arabiska': 'خُرَق', 'somaliska': 'maro nadiifin'},
      ),
    ],
  ),
  'elderly_care': CategoryContent(
    focusAreas: [
      'Omsorgssituationer och hygien',
      'Trygg kommunikation med boende',
      'Dokumentation och rapporter',
      'Samarbete med anhöriga och kollegor',
    ],
    phrases: [
      'Behöver du hjälp med något?',
      'Nu är det dags för medicin.',
      'Vill du gå en promenad?',
    ],
    tips: [
      'Prata lugnt och tydligt – repetera viktiga ord med den boende.',
      'Anteckna förändringar i hälsan direkt efter passet.',
      'Använd enkla meningar och visa med händerna när det hjälper.',
    ],
    vocabulary: [
      VocabularyEntry(
        swedish: 'medicin',
        translations: {'engelska': 'medicine', 'arabiska': 'دواء', 'somaliska': 'daawo'},
      ),
      VocabularyEntry(
        swedish: 'rullator',
        translations: {'engelska': 'walker', 'arabiska': 'مِشاية', 'somaliska': 'gaari socod'},
      ),
      VocabularyEntry(
        swedish: 'omvårdnad',
        translations: {'engelska': 'care', 'arabiska': 'رعاية', 'somaliska': 'daryeel'},
      ),
      VocabularyEntry(
        swedish: 'nattpass',
        translations: {'engelska': 'night shift', 'arabiska': 'وردية ليلية', 'somaliska': 'shifta habeenkii'},
      ),
    ],
  ),
  'restaurant': CategoryContent(
    focusAreas: [
      'Beställningar och meny',
      'Köksutrustning och råvaror',
      'Hygienregler och rutiner',
      'Service och kundbemötande',
    ],
    phrases: [
      'Vad vill du beställa?',
      'Vill du ha något att dricka till?',
      'Kan jag få notan, tack?',
    ],
    tips: [
      'Lär dig uttala menyerna högt för att bli säker vid service.',
      'Fråga gästerna hur maten smakar – använd öppna frågor.',
      'Repetera dagliga specialerbjudanden tillsammans med teamet.',
    ],
    vocabulary: [
      VocabularyEntry(
        swedish: 'beställning',
        translations: {'engelska': 'order', 'arabiska': 'طلب', 'somaliska': 'dalab'},
      ),
      VocabularyEntry(
        swedish: 'förkläde',
        translations: {'engelska': 'apron', 'arabiska': 'مِرْوَد', 'somaliska': 'guntimo'},
      ),
      VocabularyEntry(
        swedish: 'servera',
        translations: {'engelska': 'serve', 'arabiska': 'يقدم', 'somaliska': 'adeeg bixi'},
      ),
      VocabularyEntry(
        swedish: 'diskmaskin',
        translations: {'engelska': 'dishwasher', 'arabiska': 'غسالة صحون', 'somaliska': 'makiinada weel dhaqid'},
      ),
    ],
  ),
  'store': CategoryContent(
    focusAreas: [
      'Kundservice och försäljning',
      'Varuhantering och påfyllning',
      'Kassa och betalningar',
      'Returer och reklamationer',
    ],
    phrases: [
      'Hej! Kan jag hjälpa dig med något?',
      'Vill du ha kvittot i påsen?',
      'Varor kan bytas inom 30 dagar.',
    ],
    tips: [
      'Hälsa alltid kunden välkommen med ett leende.',
      'Upprepa kundens önskemål för att visa att du förstått.',
      'Lär dig namn på kampanjer och skyltar innan passet börjar.',
    ],
    vocabulary: [
      VocabularyEntry(
        swedish: 'kvitto',
        translations: {'engelska': 'receipt', 'arabiska': 'إيصال', 'somaliska': 'rasiidh'},
      ),
      VocabularyEntry(
        swedish: 'hylla',
        translations: {'engelska': 'shelf', 'arabiska': 'رف', 'somaliska': 'talaagad'},
      ),
      VocabularyEntry(
        swedish: 'kassa',
        translations: {'engelska': 'checkout', 'arabiska': 'صندوق الدفع', 'somaliska': 'kasa'},
      ),
      VocabularyEntry(
        swedish: 'erbjudande',
        translations: {'engelska': 'offer', 'arabiska': 'عرض', 'somaliska': 'dalab gaar ah'},
      ),
    ],
  ),
  'healthcare': CategoryContent(
    focusAreas: [
      'Patientkontakt och empatiskt språk',
      'Symtom och observationer',
      'Journalföring och rapporter',
      'Akuta situationer och prioritering',
    ],
    phrases: [
      'Hur mår du idag?',
      'Var har du ont?',
      'Jag kommer tillbaka om några minuter.',
    ],
    tips: [
      'Bekräfta alltid att patienten förstår vad som ska hända.',
      'Använd enkla ord när du förklarar behandlingar och mediciner.',
      'Dokumentera direkt efter varje patientmöte för att inget ska glömmas.',
    ],
    vocabulary: [
      VocabularyEntry(
        swedish: 'blodtryck',
        translations: {'engelska': 'blood pressure', 'arabiska': 'ضغط الدم', 'somaliska': 'cadaadiska dhiigga'},
      ),
      VocabularyEntry(
        swedish: 'patient',
        translations: {'engelska': 'patient', 'arabiska': 'مريض', 'somaliska': 'bukaan'},
      ),
      VocabularyEntry(
        swedish: 'undersökning',
        translations: {'engelska': 'examination', 'arabiska': 'فحص', 'somaliska': 'baaritaan'},
      ),
      VocabularyEntry(
        swedish: 'journal',
        translations: {'engelska': 'medical record', 'arabiska': 'سجل طبي', 'somaliska': 'rekoodh caafimaad'},
      ),
    ],
  ),
  'warehouse': CategoryContent(
    focusAreas: [
      'Orderplock och logistik',
      'Maskiner och hjälpmedel',
      'Säkerhetsrutiner och signaler',
      'Planering tillsammans med teamet',
    ],
    phrases: [
      'Var finns nästa order?',
      'Kan du hjälpa mig med den här pallen?',
      'Jag har kontrollerat att allt är lastat.',
    ],
    tips: [
      'Läs igenom dagens plocklista högt för att lära dig nya ord.',
      'Använd säkerhetssignalerna på svenska och repetera dem regelbundet.',
      'Kommunicera tydligt när du startar eller stoppar en maskin.',
    ],
    vocabulary: [
      VocabularyEntry(
        swedish: 'plocklista',
        translations: {'engelska': 'picking list', 'arabiska': 'قائمة التقط', 'somaliska': 'liiska qaadista'},
      ),
      VocabularyEntry(
        swedish: 'truck',
        translations: {'engelska': 'forklift', 'arabiska': 'رافعة شوكية', 'somaliska': 'forklift'},
      ),
      VocabularyEntry(
        swedish: 'pall',
        translations: {'engelska': 'pallet', 'arabiska': 'طبالية', 'somaliska': 'palet'},
      ),
      VocabularyEntry(
        swedish: 'lagerhylla',
        translations: {'engelska': 'storage shelf', 'arabiska': 'رف تخزين', 'somaliska': 'talaagad kayd'},
      ),
    ],
  ),
};

CategoryContent getCategoryContent(String categoryId) {
  return _categoryContent[categoryId] ?? _defaultContent;
}
