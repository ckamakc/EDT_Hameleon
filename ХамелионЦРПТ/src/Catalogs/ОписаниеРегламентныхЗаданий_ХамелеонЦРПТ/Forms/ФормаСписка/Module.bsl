
&НаСервере
Процедура Команда1НаСервере()
	// Вставить содержимое обработчика.
	
	Справочники.ОписаниеРегламентныхЗаданий_ХамелеонЦРПТ.ОбновитьПредопределенныеРегламент();
	
	Элементы.Список.Обновить();
КонецПроцедуры

&НаКлиенте
Процедура Команда1(Команда)
	Команда1НаСервере();
КонецПроцедуры

&НаКлиенте
Процедура Команда2(Команда)
	// Вставить содержимое обработчика.
	Если Элементы.Список.ТекущиеДанные<>Неопределено Тогда
		ПолучитьПараметрыРегламентногоЗадания=ПараметрыРеглЗаданияТекущейСтроки(Элементы.Список.ТекущиеДанные.Ссылка);
		Если ПолучитьПараметрыРегламентногоЗадания.НаКлиенте Тогда
			Попытка
				ВыполнитьРегламентНаКлиенте_ХамелеонЦРПТ(ПолучитьПараметрыРегламентногоЗадания.Алгоритм);
			Исключение
				ПоказатьПредупреждение(,"Не удалось выполнить сценарий. Ошибка "+ОписаниеОшибки());
			КонецПопытки;
		Иначе
			Попытка
				ОбщийМодуль_ВЫПОЛНИТЬ_ВЫЗОВОМ_СЕРВЕРА_ХамелеонЦРПТ.ВыполнитьНаСервере(ПолучитьПараметрыРегламентногоЗадания.Тип);
			Исключение
				ПоказатьПредупреждение(,"Не удалось выполнить сценарий. Ошибка "+ОписаниеОшибки());
			КонецПопытки;
		КонецЕсли;
	КонецЕсли;
	
КонецПроцедуры

Функция ПараметрыРеглЗаданияТекущейСтроки(Тип)
	Возврат Новый Структура("Тип,НаКлиенте,Алгоритм",Тип.Ссылка,Тип.ВыполнитьНаКлиенте,Тип.Алгоритм);
КонецФункции