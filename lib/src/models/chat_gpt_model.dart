enum ChatGptModel {
  babbage('babbage'),
  textBabbage001('text-babbage-001'),
  ada('ada'),
  textAda001('text-ada-001'),
  davinci('davinci'),
  textDavinci001('text-davinci-001'),
  textDavinci003('text-davinci-003'),
  codeDavinci002('code-davinci-002'),
  davinciInstructBeta('davinci-instruct-beta'),
  curieInstructBeta('curie-instruct-beta'),
  codeCushman001('code-cushman-001'),
  curie('curie'),
  textCurie001('text-curie-001');

  final String key;

  const ChatGptModel(this.key);
}
