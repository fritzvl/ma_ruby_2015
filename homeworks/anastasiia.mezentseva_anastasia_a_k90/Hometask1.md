# **Анализ предметной области по вышивке картин**

## Цель: Получить вышитую нитками картину

Использование **Template Pattern**

Создадим класс Вышивка (Embroidery), у которой будут такие исходные данные: схема, полотно для вышивки, нити/ленты, игла
Создадим метод Вышивать (embroider), который состоит из таких методов:
 - нарисовать разметку (draw_scheme)
 - продеть нить в иглу (thread_needle)
 - вышить картину по эскизу (finish_embroider)
Определим метод **draw_scheme** в классе Embroidery, который рисует разметку карандашом.
Определим метод **thread_needle** в классе Embroidery, который вдевает в иглу одну нить.
Определим метод **finish_еmbroider** в классе Embroidery, который вышивает.
 
Создадим класс Вышивка гладью (**StitchEmbroidery**), который наследует класс Embroidery.


Создадим класс Вышивка крестиком (**CrossStitchEmbroidery**), который наследует класс Embroidery.
Переопределим метод **draw_scheme** в классе CrossStitchEmbroidery, который создает разметку 10х10 нитей.
Переопределим метод **thread_needle** в классе CrossStitchEmbroidery, который вдевает в иглу две нити.


Создадим класс Вышивка лентами (**RibbonsEmbroidery**), который наследует класс Embroidery.
Переопределим метод **thread_needle** в классе RibbonsEmbroidery, который вдевает в иглу одну ленту.

## Вышить картину крестиком:
picture = CrossStitchEmbroidery.new

picture.embroider


## Вышить картину лентами:
picture = RibbonsEmbroidery.new

picture.embroider


## Вышить картину гладью:
picture = StitchEmbroidery.new

picture.embroider


