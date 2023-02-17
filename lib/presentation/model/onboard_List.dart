// ignore_for_file: file_names

class Onboard {
  final String image, title, description;

  Onboard({
    required this.image,
    required this.title,
    required this.description,
  });
}
final List<Onboard> demoData = [
  Onboard(
    image: "assets/images/onboarding_image/onboard1.svg",
    title: "Покупайте товары онлайн",
    description:
        "Здесь вы увидите богатый выбор товаров, тщательно классифицированных для беспрепятственного просмотра",
  ),
  Onboard(
    image: "assets/images/onboarding_image/onboard2.svg",
    title: "Наполните эти сумки для покупок",
    description:
        "Доставка от двери до двери - это не что-то что вам нужно беспокоиться. Мы позаботимся о доставке",
  ),
  Onboard(
    image: "assets/images/onboarding_image/onboard3.svg",
    title: "Быстрая и безопасная \n оплата",
    description: "Для вашего удобства доступно множество вариантов оплаты",
  ),
];
