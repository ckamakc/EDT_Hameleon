
&НаКлиенте
Процедура Команда1(Команда)
	// Вставить содержимое обработчика.
	// Вставить содержимое обработчика.
	ПолучитьПараметрыРегламентногоЗадания=ПараметрыРеглЗаданияТекущейСтроки(Объект.Ссылка);
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
	
КонецПроцедуры

Функция ПараметрыРеглЗаданияТекущейСтроки(Тип)
	Возврат Новый Структура("Тип,НаКлиенте,Алгоритм",Тип.Ссылка,Тип.ВыполнитьНаКлиенте,Тип.Алгоритм);
КонецФункции