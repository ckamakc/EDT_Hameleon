
&НаКлиенте
Процедура ОтправитьВЦРПТ(Команда)
		// Вставить содержимое обработчика.
	Для Каждого Стр Из Элементы.Список.ВыделенныеСтроки Цикл
		Форм=ПолучитьФорму("Документ.ЗаказМарок_ХамелеонЦРПТ.Форма.ФормаДокумента",Новый Структура(
		"Ключ",Стр));
		Форм.ОтправитьЗаявку(Команда);
	КонецциклА;
	Элементы.Список.Обновить();

КонецПроцедуры

&НаКлиенте
Процедура ОтправитьЗаявку(Команда)
		// Вставить содержимое обработчика.
	Для Каждого Стр Из Элементы.Список.ВыделенныеСтроки Цикл
		Форм=ПолучитьФорму("Документ.ЗаказМарок_ХамелеонЦРПТ.Форма.ФормаДокумента",Новый Структура(
		"Ключ",Стр));
		Форм.ОтправитьВЦРПТ(Команда);
	КонецциклА;
	Элементы.Список.Обновить();
	

КонецПроцедуры
