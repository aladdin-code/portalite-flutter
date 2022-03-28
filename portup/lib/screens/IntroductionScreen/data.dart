class SliderModel {
  String imageAssetPath;
  String title;
  String desc;

  SliderModel(
      {required this.imageAssetPath, required this.title, required this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = <SliderModel>[];
  SliderModel sliderModel =
      SliderModel(desc: '', imageAssetPath: '', title: '');

  //1
  sliderModel.setDesc(
      "Le portage Salarial permet d’exercer une activité professionnelle autonome en déléguant l’intégralité de la gestion administrative à une société en portage et en bénéficiant du statut de salarié");
  sliderModel.setTitle("Portage Salarial ... ");
  sliderModel.setImageAssetPath("assets/images/agreement.png");
  slides.add(sliderModel);

  sliderModel = SliderModel(desc: '', imageAssetPath: '', title: '');

  //2
  sliderModel.setDesc(
      "Optimisation des revenues nets ( PEE, PERCO). \n Zéro obligation administrative , fiscale et sociale.  \n Vous bénéficiez du chômage en cas de fin de contrat. ");
  sliderModel.setTitle("Les avontages ... ");
  sliderModel.setImageAssetPath("assets/images/support.png");
  slides.add(sliderModel);

  sliderModel = SliderModel(desc: '', imageAssetPath: '', title: '');

  //3
  sliderModel.setDesc(
      "Un vrai contrat de travail et un bulletin de salaire tous les mois.");
  sliderModel.setTitle("Contrat CDI ...");
  sliderModel.setImageAssetPath("assets/images/reciept.png");
  slides.add(sliderModel);

  sliderModel = SliderModel(desc: '', imageAssetPath: '', title: '');

  //4

  sliderModel.setDesc(
      "Trouver les meiheule developper ou flancier adecoite for your your projetc.");
  sliderModel.setTitle("Embaucher ...");
  sliderModel.setImageAssetPath("assets/images/hiring.png");
  slides.add(sliderModel);

  sliderModel = SliderModel(desc: '', imageAssetPath: '', title: '');

  return slides;
}
