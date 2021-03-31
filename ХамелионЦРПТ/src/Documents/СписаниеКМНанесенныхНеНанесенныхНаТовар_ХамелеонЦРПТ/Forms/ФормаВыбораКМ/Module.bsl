
&НаКлиенте
Процедура СтраницыПриСменеСтраницы(Элемент, ТекущаяСтраница)
	// Вставить содержимое обработчика.
	Если ТекущаяСтраница=Элементы.ВыборПартии Тогда
		Если Элементы.Продукция.ТекущиеДанные<>Неопределено Тогда
			МассивУдалимначалаВсе=Новый Массив;
			Для Каждого стр_1 Из список.Отбор.Элементы Цикл
				МассивУдалимначалаВсе.Добавить(Стр_1);
			Конеццикла;
			Для Каждого Стр Из МассивУдалимначалаВсе Цикл
				
				Список.Отбор.Элементы.Удалить(Стр);
			Конеццикла;
			
			Стр=Список.Отбор.Элементы.Добавить(Тип("ЭлементОтбораКомпоновкиДанных"));
			Стр.ВидСравнения=ВидСравненияКомпоновкиДанных.Равно;
			Стр.Использование=Истина;
			Стр.ЛевоеЗначение=Новый ПолеКомпоновкиДанных("Продукция");
			Стр.ПравоеЗначение=Элементы.Продукция.ТекущиеДанные.Ссылка; 
			Стр.РежимОтображения=РежимОтображенияЭлементаНастройкиКомпоновкиДанных.БыстрыйДоступ;
			
		КонецЕслИ;
		
		
	КонецЕслИ;
КонецПроцедуры


&НаКлиенте
Процедура ПродукцияВыбор(Элемент, ВыбраннаяСтрока, Поле, СтандартнаяОбработка)
	// Вставить содержимое обработчика.
	СтандартнаяОбработка=Ложь;
	Элементы.Страницы.ТекущаяСтраница=Элементы.ВыборПартии;
	СтраницыПриСменеСтраницы(Элемент, Элементы.ВыборПартии)	
КонецПроцедуры


&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	// Вставить содержимое обработчика.
	Организация="";
	Параметры.Свойство("Организация",Организация);
	Список.Параметры.УстановитьЗначениеПараметра("Организация",Организация);
	Продукция.Параметры.УстановитьЗначениеПараметра("Организация",Организация);
	
	
КонецПроцедуры


&НаКлиенте
Процедура ВыборПартии(Команда)
	// Вставить содержимое обработчика.
	Масс=Новый Массив;
	
	Для Каждого Стр Из Элементы.Список.ВыделенныеСтроки  Цикл
		Масс.Добавить(Стр);
		//Элементы.Список.ТекущаяСтрока=Стр;
	Конеццикла;
	
	Масс_1=Новый Массив;
	Для Каждого Стр Из Масс  Цикл
		Элементы.Список.ТекущаяСтрока=Стр;
		Масс_1.Добавить(Элементы.Список.ТекущиеДанные.СерийныйНомер)
	Конеццикла;
	ЭтаФорма.Закрыть(Масс_1);
	
	//ЭтаФорма.Закрыть(ВернутьМассивУжеЦИСОВ());
КонецПроцедуры

&НаКлиенте
Процедура СписокВыбор(Элемент, ВыбраннаяСтрока, Поле, СтандартнаяОбработка)
	// Вставить содержимое обработчика.
	Масс=Новый Массив;
	
	Для Каждого Стр Из Элементы.Список.ВыделенныеСтроки  Цикл
		Масс.Добавить(Стр);
		//Элементы.Список.ТекущаяСтрока=Стр;
	Конеццикла;
	
	Масс_1=Новый Массив;
	Для Каждого Стр Из Масс  Цикл
		Элементы.Список.ТекущаяСтрока=Стр;
		Масс_1.Добавить(Элементы.Список.ТекущиеДанные.СерийныйНомер)
	Конеццикла;
	ЭтаФорма.Закрыть(Масс_1);
	
КонецПроцедуры
&НаКлиенте
Процедура ПриОткрытии(Отказ)
	// Вставить содержимое обработчика.
	ОбновитьОСтаток();
КонецПроцедуры


&НаКлиенте
Процедура ОбновитьОстаток()
	МассивУдалимначалаВсе=Новый Массив;
	Для Каждого стр_1 Из Продукция.Отбор.Элементы Цикл
		Если Стр_1.Представление="ОТБОРОСТАТКИ" Тогда
			МассивУдалимначалаВсе.Добавить(Стр_1);
		КонецЕсли;
	Конеццикла;
	Для Каждого Стр Из МассивУдалимначалаВсе Цикл
		
		Продукция.Отбор.Элементы.Удалить(Стр);
	Конеццикла;
	Если Не ПоказатьВсе Тогда
		
		Стр=Продукция.Отбор.Элементы.Добавить(Тип("ЭлементОтбораКомпоновкиДанных"));
		Стр.ВидСравнения=ВидСравненияКомпоновкиДанных.НеРавно;
		Стр.Использование=Истина;
		Стр.ЛевоеЗначение=Новый ПолеКомпоновкиДанных("КоличествоОстаток");
		Стр.ПравоеЗначение=0; 
		Стр.Представление="ОТБОРОСТАТКИ";
		Стр.РежимОтображения=РежимОтображенияЭлементаНастройкиКомпоновкиДанных.БыстрыйДоступ;
		
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ПоказатьВсеПриИзменении(Элемент)
	// Вставить содержимое обработчика.
	ОбновитьОстаток();
КонецПроцедуры

&НаКлиенте
Процедура ОрганизацияПриИзменении(Элемент)
	// Вставить содержимое обработчика.
	ОбновитьОрганзиацияю();
КонецПроцедуры


Процедура ОбновитьОрганзиацияю()
	Список.Параметры.УстановитьЗначениеПараметра("Организация",Организация);
	Продукция.Параметры.УстановитьЗначениеПараметра("Организация",Организация);
КонецПроцедуры