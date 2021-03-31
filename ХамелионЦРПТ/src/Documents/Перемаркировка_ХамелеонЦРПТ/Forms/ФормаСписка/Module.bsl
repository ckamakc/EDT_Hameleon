
&НаКлиенте
Процедура ОбновитьСтатусы(Команда)
	
	// Вставить содержимое обработчика.
	Обр=ОткрытьФорму("Обработка._Запуск_ХамелеонЦРПТ.Форма.Форма");
	Обр.ОбновитьСтатусыДокументов(Команда);
	Попытка
		ЭтаФорма.ВладелецФормы.Активизировать();
	исключение
	КонецПопытки;
	
	ЭтаФорма.Активизировать();
	Элементы.Список.Обновить();;
	
КонецПроцедуры

&НаКлиенте
Процедура ОбновитьВыделенные(Команда)
	// Вставить содержимое обработчика.
	Обр=ОткрытьФорму("Обработка._Запуск_ХамелеонЦРПТ.Форма.Форма");
	Для Каждого Стр_11 Из Элементы.Список.ВыделенныеСтроки Цикл
		Обр.ОбновитьСтатусыДокументов(Команда,,,Стр_11);
	Конеццикла;
	Попытка
		ЭтаФорма.ВладелецФормы.Активизировать();
	исключение
	КонецПопытки;
	ЭтаФорма.Активизировать();
	Элементы.Список.Обновить();;
	
КонецПроцедуры

&НаКлиенте
Процедура ОтправитьВЦРПТ(Команда)
	// Вставить содержимое обработчика.
	Для Каждого Стр Из Элементы.Список.ВыделенныеСтроки Цикл
		Форм=ПолучитьФорму("Документ.Перемаркировка_ХамелеонЦРПТ.Форма.ФормаДокумента",Новый Структура(
		"Ключ",Стр));
		Форм.ОтправитьЗаявку(Команда);
	КонецциклА;
	Элементы.Список.Обновить();
	
КонецПроцедуры
