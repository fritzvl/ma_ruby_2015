#Магазин спорт-товарів#

Використовуємо **MVC** паттерн

Створюємо моделі:

1. Product

	* product_id
	* name
	* price
	* category

2. Cart

	* product
	* quantity

Контроллеры:

CartController

	* Додавання вибраних товарів до кошику (add_item)
	* Видалення вибраних товарів з кошику покупок (remove_item)
	* Підрахування ціни товарів, які були додані до кошику (summary_total_value)
	* здійснення оплати і виведення чеку користувачу (checkout)
	* очищення корзини покупок (clear_cart)

ProductController
	
	* Виведення списку продуктів на view (list) 
