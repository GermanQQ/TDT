 String languageName(String langCode) {
    switch (langCode) {
      case 'en':
        return 'English';
      case 'ru':
        return 'Russia';
      case 'uk':
        return 'Ukraine';
      default:
        return 'None';
    }
  }