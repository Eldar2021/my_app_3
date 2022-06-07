const getCompaniesStr = r'''
  query Company{
    companies{
      name
      logoUrl
      slug
      websiteUrl
    }
  }
''';
