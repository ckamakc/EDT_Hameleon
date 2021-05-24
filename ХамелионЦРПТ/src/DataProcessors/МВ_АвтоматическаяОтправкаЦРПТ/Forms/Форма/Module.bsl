#Область ОтравитьЦРПТ

&НаКлиенте
Процедура ОтправитьВЦРПТ(Команда) Экспорт
	
	МассивСсылок = ПолучитьМассив_НЕ_ОтправленныхЗаказовМарок();
	
	Для Каждого ДокументЗаказМарок Из МассивСсылок Цикл
		ФормЗаказаМарок = ПолучитьФорму("Документ.ЗаказМарок_ХамелеонЦРПТ.Форма.ФормаДокумента", Новый Структура("Ключ", ДокументЗаказМарок));
		ФормЗаказаМарок.ОтправитьВЦРПТ(Команда);
	КонецЦикла;
		
КонецПроцедуры

&НаСервереБезКонтекста
Функция ПолучитьМассив_НЕ_ОтправленныхЗаказовМарок()
	
	МассивСсылок = Новый Массив;
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	ЗаказМарок_ХамелеонЦРПТ.Ссылка
		|ИЗ
		|	Документ.ЗаказМарок_ХамелеонЦРПТ КАК ЗаказМарок_ХамелеонЦРПТ
		|ГДЕ
		|	ЗаказМарок_ХамелеонЦРПТ._Order_ID = """"
		|	И (ЗаказМарок_ХамелеонЦРПТ.Статус = ЗНАЧЕНИЕ(Перечисление.СтатусыДокументов_ХамелеонЦРПТ.Обработан)
		|			ИЛИ ЗаказМарок_ХамелеонЦРПТ.Статус = ЗНАЧЕНИЕ(Перечисление.СтатусыДокументов_ХамелеонЦРПТ.ОжидаетОтвета)
		|			ИЛИ ЗаказМарок_ХамелеонЦРПТ.Статус = ЗНАЧЕНИЕ(Перечисление.СтатусыДокументов_ХамелеонЦРПТ.ПодготовленКОтправке)
		|			ИЛИ ЗаказМарок_ХамелеонЦРПТ.Статус = ЗНАЧЕНИЕ(Перечисление.СтатусыДокументов_ХамелеонЦРПТ.ОжидаетОтветаОтКлиента))
		|	И ЗаказМарок_ХамелеонЦРПТ.Проведен = ИСТИНА";
	

	РезультатЗапроса = Запрос.Выполнить();
	
	Выборка = РезультатЗапроса.Выбрать();
	
	Пока Выборка.Следующий() Цикл 
		МассивСсылок.Добавить(Выборка.Ссылка);
	КонецЦикла;
	
	Возврат МассивСсылок;
КонецФункции

#КонецОбласти

#Область ПолучитьКМ

&НаКлиенте
Процедура ПолучитьКМИзAPI(Команда) Экспорт
	
	МассивСсылок = ПолучитьМассивОтправленныхЗаказовМарок();
	
	Для Каждого ДокументЗаказМарок Из МассивСсылок Цикл
		ФормЗаказаМарок = ПолучитьФорму("Документ.ЗаказМарок_ХамелеонЦРПТ.Форма.ФормаДокумента", Новый Структура("Ключ", ДокументЗаказМарок));
		ФормЗаказаМарок.ПолучитьКМИзAPI(Неопределено);
	КонецЦикла;;
	
КонецПроцедуры

&НаСервереБезКонтекста
Функция ПолучитьМассивОтправленныхЗаказовМарок()
	
	МассивСсылок = Новый Массив;
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	ЗаказМарок_ХамелеонЦРПТ.Ссылка
		|ИЗ
		|	Документ.ЗаказМарок_ХамелеонЦРПТ КАК ЗаказМарок_ХамелеонЦРПТ
		|ГДЕ
		|	ЗаказМарок_ХамелеонЦРПТ._Order_ID <> """"
		|	И ЗаказМарок_ХамелеонЦРПТ.Дата >= ДАТАВРЕМЯ(2020, 9, 21, 0, 0, 0)
		|	И (ЗаказМарок_ХамелеонЦРПТ.Статус = ЗНАЧЕНИЕ(Перечисление.СтатусыДокументов_ХамелеонЦРПТ.Отправлен)
		|			ИЛИ ЗаказМарок_ХамелеонЦРПТ.Статус = ЗНАЧЕНИЕ(Перечисление.СтатусыДокументов_ХамелеонЦРПТ.ОтправленВЭДО)
		|			ИЛИ ЗаказМарок_ХамелеонЦРПТ.Статус = ЗНАЧЕНИЕ(Перечисление.СтатусыДокументов_ХамелеонЦРПТ.ВПроцессе))
		|	И ЗаказМарок_ХамелеонЦРПТ.Проведен = ИСТИНА";
	
	РезультатЗапроса = Запрос.Выполнить();
	
	Выборка = РезультатЗапроса.Выбрать();
	
	Пока Выборка.Следующий() Цикл 
		МассивСсылок.Добавить(Выборка.Ссылка);
	КонецЦикла;
	
	Возврат МассивСсылок;
КонецФункции

#КонецОбласти

#Область ЗаписатьВПапкуКМ

&НаКлиенте
Процедура СохранитьВcsvВыделенныеЗаказы(Команда) Экспорт
	МассивСсылок = ПолучитьМассивЭмитированныхЗаказовМарок();
	
	Для Каждого ДокументЗаказМарок Из МассивСсылок Цикл
		
		Каталог = "";
		Количество = 0;
		GTINСтрока = "";
		ДвоичныеДанные = СохранитьФайлНаДиске(ДокументЗаказМарок, GTINСтрока, Каталог, Количество);
		
		Если ДвоичныеДанные <> Неопределено Тогда 
			ИмяФайла = Каталог+"\"+СтрЗаменить(СокрЛП(GTINСтрока),Символ("160"),"")+"_"+Количество+"_"+Формат(ТекущаяДата(),"ДФ=ddMMyy_HHmmss")+".csv";
			ДвоичныеДанные.Записать(ИмяФайла);
		КонецЕсли;
	Конеццикла;
	
КонецПроцедуры

&НаСервереБезКонтекста
Функция ПолучитьМассивЭмитированныхЗаказовМарок()
	
	МассивСсылок = Новый Массив;
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	ЗаказМарок_ХамелеонЦРПТ.Ссылка
		|ИЗ
		|	Документ.ЗаказМарок_ХамелеонЦРПТ.КМИзAPI КАК ЗаказМарок_ХамелеонЦРПТ
		|ГДЕ
		|	ЗаказМарок_ХамелеонЦРПТ.Ссылка._Order_ID <> """"
		|	И ЗаказМарок_ХамелеонЦРПТ.Ссылка.Статус = ЗНАЧЕНИЕ(Перечисление.СтатусыДокументов_ХамелеонЦРПТ.КМЭмитирован)
		|	И ЗаказМарок_ХамелеонЦРПТ.Ссылка.Проведен = ИСТИНА
		|	И НЕ ЗаказМарок_ХамелеонЦРПТ.Статус ПОДОБНО ""%НАПЕЧАТАН%""
		|
		|СГРУППИРОВАТЬ ПО
		|	ЗаказМарок_ХамелеонЦРПТ.Ссылка";
	
	РезультатЗапроса = Запрос.Выполнить();
	
	Выборка = РезультатЗапроса.Выбрать();
	
	Пока Выборка.Следующий() Цикл 
		МассивСсылок.Добавить(Выборка.Ссылка);
	КонецЦикла;
	
	Возврат МассивСсылок;
КонецФункции

&НаСервереБезКонтекста
Функция СохранитьФайлНаДиске(Ссылка, GTINСтрока, Каталог, Количество)
	Количество = 0;	

	ДанныеТекст = Новый ТекстовыйДокумент;
	GTINСтрока = "";
	Для Каждого СтрокаТовары Из Ссылка.Товары Цикл 
		Если ЗначениеЗаполнено(GTINСтрока) Тогда 
			GTINСтрока = GTINСтрока + ",";
		КонецЕсли;
		GTINСтрока = GTINСтрока + СтрокаТовары.GTIN.GTIN;
	КонецЦикла;
	
	GTINСтрока = Лев(GTINСтрока, 170);
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	НомераКМ_ХамелеонЦРПТ.НомерКМ КАК НомерКМ
		|ИЗ
		|	РегистрСведений.НомераКМ_ХамелеонЦРПТ КАК НомераКМ_ХамелеонЦРПТ
		|ГДЕ
		|	НомераКМ_ХамелеонЦРПТ.ДокументЗаказа = &ДокументЗаказа
		|	И НомераКМ_ХамелеонЦРПТ.КМНапечатан = ЛОЖЬ";
	
	Запрос.УстановитьПараметр("ДокументЗаказа", Ссылка);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	Выборка = РезультатЗапроса.Выбрать();
	
	Если Выборка.Количество() = 0 Тогда
		
		Для Каждого КМИзДокумента ИЗ Ссылка.КМИзAPI Цикл
			ДанныеСтрока = РаскодироватьСтроку(КМИзДокумента.НомерКМ, СпособКодированияСтроки.КодировкаURL);
			ДанныеТекст.ДобавитьСтроку(ДанныеСтрока);
		Конеццикла;
		
	Иначе
		
		Пока Выборка.Следующий() Цикл
			ДанныеСтрока = РаскодироватьСтроку(Выборка.НомерКМ, СпособКодированияСтроки.КодировкаURL);
			ДанныеТекст.ДобавитьСтроку(ДанныеСтрока);	
		КонецЦикла;	
		
	КонецеслИ;
	
	Если ДанныеТекст.КоличествоСтрок() > 0 Тогда 
		ВременныйФайлТекст = ПолучитьИмяВременногоФайла();
		ДанныеТекст.Записать(ВременныйФайлТекст, КодировкаТекста.UTF8);
		ДанныеДвоичныеДанные = Новый ДвоичныеДанные(ВременныйФайлТекст);
	    Строка64 = Base64Строка(ДанныеДвоичныеДанные);
	    Строка64 = Прав(Строка64,СтрДлина(Строка64)-4);
	    ДанныеДвоичныеДанные = Base64Значение(Строка64);
		УдалитьФайлы(ВременныйФайлТекст);
		
		ДокументЗаказаОбъект = Ссылка.ПолучитьОбъект();
		Для Каждого СтрокаКМ Из ДокументЗаказаОбъект.КМИзAPI Цикл 
			СтрокаКМ.Статус = "НАПЕЧАТАН";
		КонецЦикла;
		
		Попытка
			ДокументЗаказаОбъект.Записать();
		Исключение КонецПопытки;
		
		ДанныеНомераКМ = РегистрыСведений.НомераКМ_ХамелеонЦРПТ.СоздатьНаборЗаписей();
		ДанныеНомераКМ.Отбор.ДокументЗаказа.Установить(Ссылка);
		ДанныеНомераКМ.Прочитать();
		
		Для Каждого ЗаписьНомераКМ Из ДанныеНомераКМ Цикл 
			ЗаписьНомераКМ.КМНапечатан = Истина;
		КонецЦикла;
		
		ДанныеНомераКМ.Записать(Истина);
		
		 //++ МВ:Овчинников 21.05.2021  •0
		Каталог = РегистрыСведений.МВ_ДополнительныеНастройки.ПолучитьЗначения(ПланыВидовХарактеристик.МВ_ПереченьДополнительныхНастроек.ОКТОКаталогФайловДляЗагрузкиКМ, ТекущаяДата(),Ссылка.Организация);

		 //-- МВ:Овчинников 21.05.2021
		//Каталог = Ссылка.МВ_Интегратор.КаталогВыгрузкиКодов;
		Количество =  ДанныеТекст.КоличествоСтрок();
		Возврат ДанныеДвоичныеДанные; 
	Иначе 
		Возврат Неопределено;
	КонецЕсли;
КонецФункции

#КонецОбласти
